import logging
import requests
import random
import time

logging.basicConfig(level=logging.INFO) #DEBUG, INFO, WARNING, ERROR, CRITICAL
logger = logging.getLogger("Acceso")

url = "http://127.0.0.1:5000/"
token = "5678"

def intentar_acceso():
    return random.choice(["Autorizado", "Fallido", "No Autorizado"])

while True:
    resultado = intentar_acceso()
    
    if resultado == "Autorizado":
        nivel = "Info"
        mensaje = "Acceso autorizado"
        logger.info(mensaje)
    elif resultado == "Fallido":
        nivel = "Warning"
        mensaje = "Intento de acceso fallido"
        logger.warning(mensaje)
    elif resultado == "No Autorizado": 
        nivel = "Error"
        mensaje = "Intento de acceso no autorizado"
        logger.error(mensaje)

    log_data = {
        "nombre_servicio": "Acceso",
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
