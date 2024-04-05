// $(document).ready(function() {
//     var socket = io(); // Se connecte automatiquement au serveur qui sert la page

//     // Récupérer les données initiales via API REST
//     fetch('http://192.168.0.100:3005/consoeau')
//         .then(response => response.json())
//         .then(data => {
//             console.log(data); // Affiche les données dans la console pour vérification
//             // Vous pouvez ensuite mettre à jour l'UI avec ces données
//             // Exemple (adaptez selon la structure exacte de vos données) :
//             if (data.length > 0) {
//                 $('#timestamp').text(data[0].horodatage);
//                 $('#volume').text(data[0].volume + ' L');
//                 $('#debitInstantane').text(data[0].debit_instantane + ' L/min');
//             }
//         })
//         .catch(error => console.error('Erreur lors de la récupération des données:', error));
        
//         socket.on('water-usage-data', function(data) {
//             // Mettre à jour l'interface avec les nouvelles données
//             $('#timestamp').text(data.horodatage);
//             $('#volume').text(data.volume + ' L');
//             $('#debitInstantane').text(data.debit_instantane + ' L/min');
//           });
// });


