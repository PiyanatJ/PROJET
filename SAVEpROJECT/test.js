const express = require("express");
const mysql = require("mysql2");
const mqtt = require("mqtt");
const bodyParser = require("body-parser");
const app = express();
const http = require("http").createServer(app);
const io = require("socket.io")(http);
const cors = require("cors"); 
const fs = require('fs');


app.use(cors());

app.use(bodyParser.json());


const privateKey = fs.readFileSync('key.pem','utf-8')
const certificate = fs.readFileSync('cert.pem','utf-8')
const credentials = {key: privateKey, cert: certificate}


const options = {
  host: '869f5f08c802466b8fe9c2ec0dcf2a94.s1.eu.hivemq.cloud',
  port: 8883,
  protocol: 'mqtts',
  username: 'Piyanat',
  password: '<Projet12345>',
  privateKey : fs.readFileSync('key.pem','utf-8'),
  certificate : fs.readFileSync('cert.pem','utf-8')
}


const connect = mysql.createConnection({
  host: "localhost",
  user: "ciel",
  password: "ciel",
  database: "compteur_eau",
  port: 3306
});

connect.connect(function(err) {
  if (err) {
    console.error('Erreur de connexion à MySQL : ' + err.message);
    return;
  }
  console.log('Connecté avec succès à la base de données MySQL.');
});

const mqttClient = mqtt.connect(mqttServer, options);

mqttClient.on("connect", () => {
  console.log("Connecté au broker MQTT");
  mqttClient.subscribe(["compteur/mqtt", "electrovanne/commande", "alerte/fuite", "maison/mode"], { qos: 0 });
});


mqttClient.on("message", (topic, message) => {
  const timezoneOffsetInSeconds = 3600;
  console.log(`Message reçu du sujet ${topic}: ${message.toString()}`);
  const now = new Date();
  const localTime = new Date(now.getTime() + timezoneOffsetInSeconds * 1000);
  const horodatage = localTime.toISOString().slice(0, 19).replace('T', ' ');

  if (topic === "alerte/fuite") {
    const alertMessage = message.toString();
    const sql = "INSERT INTO alertes (horodatage, type_alerte) VALUES (?, ?)";
    connect.query(sql, [horodatage, alertMessage], (err, result) => {
        if (err) {
            console.error("Erreur lors de l'insertion de l'alerte dans MySQL", err);
        } else {
            console.log("Alerte insérée avec succès dans MySQL");
            io.emit("leak-alert", { message: alertMessage, timestamp: horodatage });
        }
    });

  } else if (topic === "electrovanne/commande") {
    const etat = message.toString() === 'OUVERT' ? 'OUVERT' : 'FERMÉ';
    const sql = "INSERT INTO etat_electrovanne (horodatage, etat) VALUES (?, ?)";
    connect.query(sql, [horodatage, etat], (err, result) => {
      if (err) {
        console.error("Erreur lors de l'insertion de l'état de l'électrovanne dans MySQL", err);
      } else {
        console.log("État de l'électrovanne inséré avec succès dans MySQL");
        io.emit("electrovanne-state-change", { etat: etat, horodatage: horodatage });
      }
    });
  } else   if (topic === "compteur/mqtt") {
    let data;
    try {
      data = JSON.parse(message.toString()); // Assurez-vous de bien convertir le message en objet JavaScript
      const sql = "INSERT INTO consoeau (horodatage, volume, debit_instantane) VALUES (?, ?, ?)";
      connect.query(sql, [horodatage, data.volume, data.debit_instantane], (err, result) => {
        if (err) {
          console.error("Erreur lors de l'insertion des données de consommation d'eau dans MySQL", err);
        } else {
          console.log("Données de consommation d'eau insérées avec succès dans MySQL");
          // Ici, l'émission Socket.IO aux clients connectés
          io.emit("water-usage-data", { horodatage, volume: data.volume, debit_instantane: data.debit_instantane });
        }
      });
    } catch (e) {
      console.error("Erreur lors de la conversion du message en JSON", e);
    }
  // ... autres cas omis pour la clarté
  }else if (topic == "maison/mode"){
    const mode = message.toString();
    const sql = "INSERT INTO mode (horodatage, etat) VALUES ( ?, ?)";
    connect.query(sql, [horodatage, mode], (err, result) => {
      if (err) {
          console.error("Erreur lors de l'insertion de l'alerte dans MySQL", err);
      } else {
          console.log("Alerte insérée avec succès dans MySQL");
          io.emit("mode-change", { horodatage: horodatage, mode: mode });
      }
  });
  }     
});


app.get("/consoeau", (req, res) => {
  connect.query("SELECT * FROM consoeau", (err, results) => {
    if (err) {
      console.error("Erreur lors de la récupération des données", err);
      return res.status(500).send("Erreur lors de la récupération des données");
    }
    res.json(results);
  });
});

app.get("/etat_electrovanne", (req, res) => {
  connect.query("SELECT * FROM etat_electrovanne ORDER BY horodatage DESC LIMIT 1", (err, results) => {
    if (err) {
      console.error("Erreur lors de la récupération de l'état de l'électrovanne", err);
      return res.status(500).send("Erreur lors de la récupération de l'état de l'électrovanne");
    }
    res.json(results[0] || {});
  });
});



app.post("/alerte/fuite", (req, res) => {
  const { message } = req.body;

  // Publier directement sur MQTT
  mqttClient.publish("alerte/fuite", message, { qos: 1 }, (error) => {
    if (error) {
      console.error('Erreur lors de la publication du message MQTT:', error);
      return res.status(500).send('Erreur lors de la publication du message MQTT');
    }
    console.log("Message d'alerte de fuite publié avec succès:", message);
    res.status(200).send("Alerte de fuite publiée avec succès");
  });
});

app.post("/electrovanne/commande", (req, res) => {
  const { etat } = req.body; // 'OUVERT' ou 'FERMÉ'

  // Publier directement sur MQTT sans insertion dans la base de données ici
  mqttClient.publish("electrovanne/commande", etat, { qos: 1 }, (error) => {
    if (error) {
      console.error('Erreur lors de la publication du message MQTT:', error);
      return res.status(500).send('Erreur lors de la publication du message MQTT');
    }
    console.log('Message MQTT publié avec succès:', etat);
    res.status(200).send("Commande d'électrovanne envoyée avec succès");
  });
});


app.post("/maison/mode", (req, res) => {
  const { mode } = req.body;

  // Valider le mode avant de publier
  if (mode !== "PRESENT" && mode !== "ABSENT") {
    return res.status(400).send("Mode invalide. Le mode doit être 'present' ou 'absent'.");
  }
  // Publier le mode sur MQTT
  mqttClient.publish("maison/mode", mode, { qos: 1 }, (error) => {
    if (error) {
      console.error("Erreur lors de la publication du mode MQTT: ", error);
      return res.status(500).send("Erreur lors de la publication du mode MQTT");
    }
    console.log("Mode publié avec succès sur MQTT", mode);
    res.status(200).send("Mode publié avec succès sur MQTT");
  });
});

app.post("/compteur/mqtt", (req, res) => {
  const { volume, debit_instantane } = req.body;

  if (!volume || !debit_instantane) {
    console.error("Données manquantes dans la requête");
    return res.status(400).send("Données manquantes");
  }

  // Convertir en string JSON pour l'envoi via MQTT
  const message = JSON.stringify({ volume, debit_instantane });

  mqttClient.publish("compteur/mqtt", message, { qos: 1 }, (error) => {
    if (error) {
      console.error("Erreur lors de la publication du message MQTT :", error);
      return res.status(500).send("Erreur lors de la publication");
    }
    console.log("Données de consommation d'eau publiées avec succès :", message);
    res.status(200).send("Données de consommation publiées avec succès");
  });
});


io.on("connection", (socket) => {
  socket.on("commande_electrovanne", (etat) => {
    mqttClient.publish("electrovanne/commande", etat, { qos: 1 }, (error) => {
      if (error) {
        console.error("Erreur lors de la publication de la commande: ", error);
        socket.emit("status", "Erreur lors de la publication de la commande");
      } else {
        socket.emit("status", `Commande "${etat}" pour l'électrovanne a été publiée`);
      }
    });
  });
});

// Gérer les erreurs de Socket.IO
io.on("error", (error) => {
  console.error("Erreur Socket.IO: ", error);
});

// Définir le port
const PORT = 3005;



// Démarrer le serveur HTTP et Socket.IO
http.listen(PORT, () => {
  console.log(`Le serveur est en marche sur le port ${PORT}.`);
});