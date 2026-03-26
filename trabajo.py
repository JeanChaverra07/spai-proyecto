from datetime import datetime

class Tarea:
    def __init__(self, id, nombre, fecha, dificultad, tiempo):
        self.id = id
        self.nombre = nombre
        self.fecha = datetime.strptime(fecha, "%Y-%m-%d")
        self.dificultad = dificultad.upper()
        self.tiempo = tiempo
        self.estado = "Pendiente"
        self.prioridad = 0

    
    def calcular_prioridad(self):
        dias_restantes = (self.fecha - datetime.now()).days

        prioridad = 0

        
        prioridad += max(0, 5 - dias_restantes)

      
        valores_dificultad = {"F": 1, "M": 2, "D": 3}
        prioridad += valores_dificultad.get(self.dificultad, 1)

        
        prioridad += self.tiempo

        self.prioridad = prioridad

    def completar(self):
        self.estado = "Completada"
        
class GestorTareas:
    def __init__(self):
        self.tareas = []

    def agregar_tarea(self, tarea):
        self.tareas.append(tarea)

    def listar_tareas(self):
        if not self.tareas:
            print("\nNo hay tareas registradas.")
            return

        print("\n--- LISTA DE TAREAS ---")
        for t in self.tareas:
            t.calcular_prioridad()
            print(f"{t.id} | {t.nombre} | Prioridad: {t.prioridad} | Estado: {t.estado}")
