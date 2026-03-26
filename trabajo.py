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
    
    def completar_tarea(self, id):
        for t in self.tareas:
            if t.id == id:
                t.completar()
                print("Tarea completada")
                return
        print("Tarea no encontrada")

    def eliminar_tarea(self, id):
        for t in self.tareas:
            if t.id == id:
                self.tareas.remove(t)
                print("🗑 Tarea eliminada")
                return
        print("Tarea no encontrada")

    
    def recomendar_tarea(self):
        if not self.tareas:
            print("No hay tareas.")
            return

        for t in self.tareas:
            t.calcular_prioridad()

        mejor = sorted(self.tareas, key=lambda x: x.prioridad, reverse=True)[0]

        print("\nRECOMENDACIÓN:")
        print(f"Debes hacer primero: {mejor.nombre} (Prioridad: {mejor.prioridad})")

    
    def mostrar_productividad(self):
        total = len(self.tareas)
        if total == 0:
            print("No hay tareas.")
            return

        completadas = sum(1 for t in self.tareas if t.estado == "Completada")
        pendientes = total - completadas
        porcentaje = (completadas / total) * 100

        print("PRODUCTIVIDAD")
        print(f"Tareas totales: {total}")
        print(f"Completadas: {completadas}")
        print(f"Pendientes: {pendientes}")
        print(f"Progreso: {porcentaje:.2f}%")

    def mostrar_alertas(self):
        print(" ALERTAS:")
        for t in self.tareas:
            dias = (t.fecha - datetime.now()).days
            if dias <= 2 and t.estado == "Pendiente":
                print(f"Tarea urgente: {t.nombre} (vence en {dias} días)")



def menu():
    gestor = GestorTareas()
    contador_id = 1

    while True:
        print("\n===== SISTEMA SPAI =====")
        print("1. Crear tarea")
        print("2. Listar tareas")
        print("3. Completar tarea")
        print("4. Eliminar tarea")
        print("5. Recomendación")
        print("6. Productividad")
        print("7. Alertas")
        print("8. Salir")

        opcion = input("Seleccione una opción: ")

        if opcion == "1":
            nombre = input("Nombre: ")
            fecha = input("Fecha (YYYY-MM-DD): ")
            dificultad = input("Dificultad (F/M/D): ")
            tiempo = int(input("Tiempo estimado (horas): "))

            tarea = Tarea(contador_id, nombre, fecha, dificultad, tiempo)
            gestor.agregar_tarea(tarea)
            contador_id += 1

            print("Tarea creada")