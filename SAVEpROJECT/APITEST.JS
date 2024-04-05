const express = require("express");
const mysql = require("mysql2");
const mqtt = require("mqtt");
const bodyParser = require("body-parser");
const app = express();
const fs = require('fs');
const http = require("http").createServer(app);
const https = require("https")
const socketio = require("socket.io")(http);
const cors = require("cors"); // Ajout du module CORS


const options1 = {
    // ... autres options ...
    port: 8883, // Port par défaut pour MQTTS
    host: 'mqtts://votre_broker_mqtt',
    key: fs.readFileSync(path.join(dirname, 'key.pem')),
    cert: fs.readFileSync(path.join(dirname, 'cert.pem')),
    // Si vous avez besoin du certificat CA (dans le cas d'un broker utilisant un certificat signé par une autorité privée ou auto-signé) :
    // ca: fs.readFileSync(path.join(__dirname, 'ca-cert.pem')),
    // ...
  };
  
  const client = mqtt.connect(options);
  
  client.on('connect', () => {
    console.log('Connecté au broker MQTTS');
  });
  
  client.on('error', (error) => {
    console.error('Erreur de connexion:', error);
  });


app.use(cors());

app.use(bodyParser.json());


const privateKey = fs.readFileSync('key.pem','utf-8')
const certificate = fs.readFileSync('cert.pem','utf-8')
const credentials = {key: privateKey, cert: certificate}

const httpsServer = https.createServer(credentials,app, (req, res) => {

  res.writeHead(200)
  res.end("serveur en https !!")

})
const io = socketio(httpsServer);

const mqttServer = "mqtt://192.168.5.144:1883";
const options = {
  username: "ciel",
  password: "ciel"
};

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
  mqttClient.subscribe(["compteur/mqtt", "electrovanne/commande", "alerte/fuite"], { qos: 0 });
});




mqttClient.on("message", (topic, message) => {
  console.log(`Message reçu du sujet ${topic}: ${message.toString()}`);

  // En fonction du sujet, émettre des événements spécifiques à travers Socket.IO pour notifier les clients en temps réel
  if (topic === "alerte/fuite") {
    const alertMessage = message.toString();
    // Émettre une alerte de fuite aux clients connectés via Socket.IO
    io.emit("leak-alert", { message: alertMessage });
  } else if (topic === "electrovanne/commande") {
    const etat = message.toString() === 'OUVERT' ? 'OUVERT' : 'FERMÉ';
    // Émettre un changement d'état de l'électrovanne aux clients connectés via Socket.IO
    io.emit("electrovanne-state-change", { etat: etat });
  } else if (topic === "compteur/mqtt") {
    let data;
    try {
      data = JSON.parse(message);
    } catch (e) {
      console.error("Erreur lors de la conversion du message en JSON", e);
      return; // Stop l'exécution si erreur de parsing
    }
    // Émettre les données de consommation d'eau aux clients connectés via Socket.IO
    io.emit("water-usage-data", data);
  }
    // Traitement spécifique pour le sujet "maison/mode"
    else if (topic === "maison/mode") {
      const mode = message.toString();
      // Émettre un événement vers les clients connectés via Socket.IO pour notifier le changement de mode
      io.emit("mode-change", { mode: mode });
    }
});


app.post("/alerte/fuite", (req, res) => {
  const { message } = req.body;
  const horodatage = new Date().toISOString().slice(0, 19).replace('T', ' ');

  const sql = "INSERT INTO alertes (horodatage, type_alerte) VALUES (?, ?)";
  connect.query(sql, [horodatage, message], (err, result) => {
    if (err) {
      console.error("Erreur lors de l'insertion de l'alerte dans MySQL", err);
      return res.status(500).send("Erreur lors de l'insertion de l'alerte");
    }
    console.log("Alerte insérée avec succès dans MySQL");
    io.emit("leak-alert", { message: message, timestamp: horodatage });
    res.status(200).send("Alerte insérée avec succès");
  });
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



app.post("/electrovanne/commande", (req, res) => {
  const { etat } = req.body; 

  connect.query("INSERT INTO etat_electrovanne (etat, horodatage) VALUES (?, NOW())", [etat], (err, results) => {
    if (err) {
      console.error("Erreur lors de l'enregistrement de l'état de l'électrovanne", err);
      return res.status(500).send("Erreur lors de l'enregistrement de l'état de l'électrovanne");
    }
    console.log("État de l'électrovanne enregistré avec succès");

    const mqttClient = mqtt.connect(mqttServer); // Ici semble être le problème
    mqttClient.on('connect', function () {
      mqttClient.publish("electrovanne/commande", etat, function (err) {
        if (err) {
          console.error('Erreur lors de la publication du message MQTT:', err);
        } else {
          console.log('Message MQTT publié avec succès:', etat);
        }
        mqttClient.end();
      });
    });

    res.status(200).send("État de l'électrovanne enregistré avec succès");
  });
});



app.post("/maison/mode", (req, res) => {
  const { mode } = req.body; // Récupère le mode depuis le corps de la requête

  const sql = "INSERT INTO mode (horodatage,etat) VALUES (?,?)";
  connect.query(sql, [etat], (err, result) => {
    if (err) {
      console.error("Erreur lors de l'insertion de l'état du mode dans MySQL", err);
      return res.status(500).send("Erreur lors de l'insertion de l'état du mode");
    }
    console.log("État du mode inséré avec succès dans MySQL");
    res.status(200).send("État du mode inséré avec succès dans la base de données");
  });

  // Vérifie si le mode est valide (présent ou absent)
  if (mode !== "present" && mode !== "absent") {
    return res.status(400).send("Mode invalide. Le mode doit être 'present' ou 'absent'.");
  }

  // Publiez le mode sur le broker MQTT
  mqttClient.publish("maison/mode", mode, { qos: 1 }, (error) => {
    if (error) {
      console.error("Erreur lors de la publication du mode MQTT : ", error);
      return res.status(500).send("Erreur lors de la publication du mode MQTT");
    }
    // Envoie une réponse de succès
    res.status(200).send("Mode publié avec succès sur MQTT");
  });
});


app.post("/compteur/mqtt", (req, res) => {
  const { volume, debit_instantane } = req.body;
  const horodatage = new Date().toISOString().slice(0, 19).replace('T', ' ');

  const sql = "INSERT INTO consoeau (horodatage, volume, debit_instantane) VALUES (?, ?, ?)";
  connect.query(sql, [horodatage, volume, debit_instantane], (err, result) => {
    if (err) {
      console.error("Erreur lors de l'insertion des données de consommation d'eau dans MySQL", err);
      return res.status(500).send("Erreur lors de l'insertion des données de consommation d'eau");
    }
    console.log("Données de consommation d'eau insérées avec succès dans MySQL");
    io.emit("water-usage-data", { volume, debit_instantane, horodatage });
    res.status(200).send("Données de consommation d'eau enregistrées avec succès");
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

const PORT = 3000


// Démarrer le serveur HTTP et Socket.IO
httpsServer.listen(PORT, () => {
  console.log(`Le serveur est en marche sur le port ${PORT}.`);

});