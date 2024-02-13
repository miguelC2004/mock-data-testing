import mysql.connector
from faker import Faker
from datetime import datetime, timedelta
import random

db_config = {
    'host': 'localhost',
    'user': 'root',
    'password': '',
    'database': 'chat_soporte'
}

# Configuración del generador de datos falsos (Fake Data)
fake = Faker()

# Función para generar datos falsos de chat
def generate_chat_data():
    conn_id = None
    while conn_id is None or conn_id in existing_conn_ids:
        conn_id = fake.random_int(min=11, max=1000)
    existing_conn_ids.add(conn_id)

    channel = random.choice(['whatsapp', 'facebook', 'email'])
    date = fake.date_between(start_date='-30d', end_date='today')
    agent_id = fake.random_int(min=1, max=3)
    agent_name = fake.name()
    chat_duration = str(timedelta(minutes=fake.random_int(min=5, max=30)))
    description_cod_act = fake.word()
    comments = fake.text() if random.choice([True, False]) else None

    return (conn_id, channel, date, agent_id, agent_name, chat_duration, description_cod_act, comments)

# Conexión a la base de datos
try:
    connection = mysql.connector.connect(**db_config)
    cursor = connection.cursor()

    # Obtener los existentes conn_ids
    existing_conn_ids_query = "SELECT CONN_ID FROM chats"
    cursor.execute(existing_conn_ids_query)
    existing_conn_ids = set(conn_id[0] for conn_id in cursor.fetchall())

    # Generar datos y realizar inserciones
    for _ in range(100):  # Cambia el rango según la cantidad de datos que desees insertar
        chat_data = generate_chat_data()
        insert_query = "INSERT INTO chats VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
        cursor.execute(insert_query, chat_data)

    # Confirmar los cambios
    connection.commit()

except mysql.connector.Error as err:
    print(f"Error: {err}")

finally:
    # Cerrar la conexión
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("Conexión cerrada")
