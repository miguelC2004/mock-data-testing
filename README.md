# mock-data-testing
# Generador de datos para base de datos de chats de soporte

Este script de Python se utiliza para insertar datos de prueba en una base de datos MySQL/MariaDB que representa registros de chats de soporte.

## Requisitos

- Python 3.x
- Biblioteca mysql-connector-python
- Biblioteca Faker

Instala las bibliotecas necesarias ejecutando el siguiente comando:

```bash
pip install mysql-connector-python faker
```
## Descripción
El script genera datos ficticios de chats de soporte y los inserta en la tabla chats de la base de datos. Cada chat tiene los siguientes campos:

```SQL
ONN_ID: Identificador de conexión único.
CHANNEL: Canal de comunicación del chat (WhatsApp, Facebook, correo electrónico, etc.).
DATE: Fecha del chat.
AGENT_ID: Identificador único del agente de soporte.
AGENT_NAME: Nombre del agente de soporte.
CHAT_DURATION: Duración del chat.
DESCRIPTION_COD_ACT: Descripción o código de actividad del chat.
COMMENTS: Comentarios adicionales sobre el chat (opcional).
```
