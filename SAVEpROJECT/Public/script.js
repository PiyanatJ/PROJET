// Se connecter au serveur Socket.IO
const socket = io();

// Écouter l'événement "water-usage-data" émis par le serveur
socket.on("water-usage-data", (data) => {
    // Mettre à jour les éléments HTML avec les données reçues
    document.getElementById("timestamp").textContent = data.horodatage;
    document.getElementById("volume").textContent = data.volume + " L";
    document.getElementById("debitInstantane").textContent = data.debit_instantane + " L";
    
});
