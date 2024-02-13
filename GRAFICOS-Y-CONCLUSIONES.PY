import mysql.connector
import tkinter as tk
from tkinter import ttk
from matplotlib.figure import Figure
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="",
    database="chat_soporte"
)
cursor = conn.cursor()
query = "SELECT * FROM chats"
cursor.execute(query)
data = cursor.fetchall()

validacion_interacciones = [chat for chat in data if chat[6] == 'Validación']
proceso_seguimiento_interacciones = [chat for chat in data if chat[6] == 'Proceso de Seguimiento']

# Agrupar interacciones por día
interacciones_por_dia = {}
for chat in data:
    fecha = chat[2].strftime('%Y-%m-%d')
    if fecha in interacciones_por_dia:
        interacciones_por_dia[fecha].append(chat)
    else:
        interacciones_por_dia[fecha] = [chat]

# Cálculo de KPIs
total_interacciones = len(data)
total_validacion_interacciones = len(validacion_interacciones)
total_proceso_seguimiento_interacciones = len(proceso_seguimiento_interacciones)

tasa_aprobacion_diaria = total_validacion_interacciones / total_interacciones if total_interacciones > 0 else 0

tiempo_promedio_gestion = sum(chat[5].total_seconds() for chat in data) / total_interacciones if total_interacciones > 0 else 0

root = tk.Tk()
root.title("KPI de Chats")
root.geometry("1300x1368")
frame = ttk.Frame(root)
frame.grid(column=0, row=0, padx=10, pady=10)

# Crear figura de Matplotlib
fig = Figure(figsize=(8, 6), dpi=100)
plot_area = fig.add_subplot(111)
plot_area.bar(["Total de Interacciones", "Tasa de Aprobación Diaria", "Tiempo Promedio de Gestión (segundos)"],
              [total_interacciones, tasa_aprobacion_diaria, tiempo_promedio_gestion], color=['skyblue', 'lightgreen', 'lightcoral'])
plot_area.set_xticklabels(["Total", "Aprobación", "Tiempo Gestión"])
plot_area.set_ylabel("Valor")
plot_area.set_title("KPI de Chats")

canvas = FigureCanvasTkAgg(fig, master=frame)
canvas.draw()
canvas.get_tk_widget().pack(side=tk.TOP, fill=tk.BOTH, expand=1)

# Etiquetas informativas
info_label = ttk.Label(frame, text=f"Total de Interacciones: {total_interacciones}\n\n"
                                   f"Tasa de Aprobación Diaria: {tasa_aprobacion_diaria:.2%}\n\n"
                                   f"Tiempo Promedio de Gestión: {tiempo_promedio_gestion:.2f} segundos")
info_label.pack()

root.mainloop()
cursor.close()
conn.close()
