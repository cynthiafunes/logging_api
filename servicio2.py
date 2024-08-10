import logging
import requests
import random
import time

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger("Movimiento")

url = "http://127.0.0.1:5000/"
token = "1234"

def detectar_movimiento():
    return random.choice([True, False])

while True:
    movimiento = detectar_movimiento()
    
    if movimiento == True:
        nivel = "Warning"
        mensaje = "Movimiento detectado"
        logger.warning(mensaje)
    elif movimiento == False:
        nivel = "Info"
        mensaje = "No se detectó movimiento."
        logger.info(mensaje)

    log_data = {
        "nombre_servicio": "Movimiento",
        "nivel_log": nivel,
        "mensaje": mensaje
    }

    try:
        response = requests.post(url, json=log_data, headers={"Authorization": token})
        if response.status_code == 201:
            print("Log enviado correctamente")
        else:
            print("Error al enviar log")
    except:
        print("Error de conexión")
    
    time.sleep(15) 
