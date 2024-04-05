# pip install paho-mqtt 

import paho.mqtt.publish as publish

# Définir le broker
broker_address = "broker.hivemq.com"

# Définir le sujet (topic) sur lequel publier
topic = "snir/bts/2023/msg"

# Définir le message à publier
message = "Bonjour, les BTS SNIR2"
publish.single(topic, message, hostname=broker_address)