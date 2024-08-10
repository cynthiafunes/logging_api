from flask import Flask, request, jsonify
import psycopg2

app = Flask(__name__)

def obtener_conexion():
    conexion = psycopg2.connect(
        host="localhost",
        port="5433",
        database="logging_db",
        user="postgres",
        password="Lemontree30"
    )
    return conexion

TOKENS_VALIDOS = ["1234", "5678", "9101"]

@app.route('/', methods=['POST'])
def recibir_logs():
    token = request.headers.get('Authorization')
    if token not in TOKENS_VALIDOS:
        return jsonify({"error": "No autorizado"}), 403

    datos = request.json
    nombre_servicio = datos.get('nombre_servicio')
    nivel_log = datos.get('nivel_log')
    mensaje = datos.get('mensaje')

    if not nombre_servicio or not nivel_log or not mensaje:
        return jsonify({"error": "Faltan datos en el log"}), 400

    try:
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        cursor.execute(
            "INSERT INTO logs (nombre_servicio, nivel_log, mensaje) VALUES (%s, %s, %s)",
            (nombre_servicio, nivel_log, mensaje)
        )
        conexion.commit()
        cursor.close()
        conexion.close()
        return jsonify({"mensaje": "Log registrado exitosamente"}), 201
    except:
        return jsonify({"error": "Ocurrio un error"}), 500


@app.route('/', methods=['GET'])
def consultar_logs():
    try:
        conexion = obtener_conexion()
        cursor = conexion.cursor()

        consulta_sql = "SELECT * FROM logs"
        filtros = []
        parametros = []

        fecha_inicio = request.args.get('fecha_inicio')
        fecha_fin = request.args.get('fecha_fin')
        nivel_log = request.args.get('nivel_log')
        nombre_servicio = request.args.get('nombre_servicio')

        if fecha_inicio:
            filtros.append("fecha >= %s")
            parametros.append(fecha_inicio)
        if fecha_fin:
            filtros.append("fecha <= %s")
            parametros.append(fecha_fin)
        if nivel_log:
            filtros.append("nivel_log = %s")
            parametros.append(nivel_log)
        if nombre_servicio:
            filtros.append("nombre_servicio = %s")
            parametros.append(nombre_servicio)

        if filtros:
            consulta_sql = consulta_sql + " WHERE " + " AND ".join(filtros)

        consulta_sql = consulta_sql + " ORDER BY fecha DESC"

        cursor.execute(consulta_sql, tuple(parametros))
        logs = cursor.fetchall()
        
        cursor.close()
        conexion.close()

        logs_resultado = []
        for log in logs:
            logs_resultado.append({
                "id": log[0],
                "nombre_servicio": log[1],
                "nivel_log": log[2],
                "mensaje": log[3],
                "fecha": log[4]
            })

        return jsonify(logs_resultado), 200
    except:
        return jsonify({"error": "Ocurrió un error interno"}), 500
    
app.run(port=5000)

