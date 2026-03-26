# PROYECTO – PRIMERA ENTREGA

Sistema de Planificación Académica Inteligente (SPAI)



# 1. DESCRIPCIÓN DEL PROBLEMA

En el entorno universitario, los estudiantes deben gestionar múltiples actividades académicas como tareas, talleres, proyectos y evaluaciones, cada una con diferentes fechas de entrega, niveles de dificultad y tiempos estimados de realización. Sin embargo, esta gestión suele hacerse de manera manual o mediante herramientas básicas que no permiten analizar adecuadamente la carga académica.

Esta situación genera problemas como la mala distribución del tiempo, la acumulación de tareas cercanas a la fecha de entrega, la falta de priorización de actividades importantes y, en consecuencia, un bajo rendimiento académico.

El problema principal es la falta de una herramienta que no solo registre tareas, sino que también analice la información asociada a estas y apoye al estudiante en la toma de decisiones sobre cómo organizar su tiempo.

Para dar solución a este problema, se propone el desarrollo de un sistema que permita gestionar tareas académicas e incorpore funcionalidades como priorización automática, generación de recomendaciones y análisis de productividad, con el fin de mejorar la organización y el desempeño del estudiante.

---

# 2. ANÁLISIS DEL PROBLEMA

## 2.1 Definición de los requisitos funcionales

### RF1: Crear tarea

El sistema debe permitir registrar una tarea con nombre, fecha de entrega, nivel de dificultad y tiempo estimado.

**Prototipo:**

```
[CREAR TAREA]
Nombre: __________
Fecha: __________
Dificultad: (Fácil / Media / Difícil)
Tiempo estimado (horas): ___
```

---

### RF2: Listar tareas

El sistema debe mostrar todas las tareas registradas con su prioridad y estado.

**Prototipo:**

```
[LISTA DE TAREAS]
ID | Nombre | Prioridad | Estado
1  | Física | Alta      | Pendiente
```

---

### RF3: Marcar tarea como completada

El sistema debe permitir cambiar el estado de una tarea a completada.

**Prototipo:**

```
[COMPLETAR TAREA]
Ingrese ID: ___
```

---

### RF4: Eliminar tarea

El sistema debe permitir eliminar una tarea del sistema.

**Prototipo:**

```
[ELIMINAR TAREA]
Ingrese ID: ___
```

---

### RF5: Priorización inteligente (Integrante 1)

El sistema debe calcular automáticamente la prioridad de cada tarea considerando:

* Días restantes para la entrega
* Nivel de dificultad
* Tiempo estimado

---

### RF6: Sistema de recomendación (Integrante 2)

El sistema debe sugerir al usuario qué tarea realizar primero, basándose en la prioridad calculada.

**Prototipo:**

```
[RECOMENDACIÓN]
1. Física (alta prioridad)
2. Matemáticas
```

---

### RF7: Análisis de productividad (Integrante 3)

El sistema debe mostrar métricas de progreso del usuario.

**Prototipo:**

```
[PRODUCTIVIDAD]
Tareas totales: 5
Completadas: 3
Pendientes: 2
Progreso: 60%
```

---

## 2.2 Modelo del mundo del problema (UML)

El sistema se compone de las siguientes clases:

### Clase Tarea

Atributos:

* id
* nombre
* fecha
* dificultad
* tiempo_estimado
* estado
* prioridad

Métodos:

* calcular_prioridad()
* completar()

---

### Clase GestorTareas

Atributos:

* lista_tareas

Métodos:

* agregar_tarea()
* eliminar_tarea()
* listar_tareas()
* recomendar_tarea()
* calcular_productividad()

---

### Clase Sistema

Métodos:

* mostrar_menu()
* ejecutar()

---

## 2.3 Descomposición y asignación de responsabilidades

El sistema se divide en tres módulos principales:

### Módulo 1: Gestión de tareas

Responsable: Estudiante 1
Funciones:

* Crear tareas
* Eliminar tareas

---

### Módulo 2: Lógica del sistema

Responsable: Estudiante 2
Funciones:

* Cálculo de prioridad
* Generación de recomendaciones

---

### Módulo 3: Interfaz y métricas

Responsable: Estudiante 3
Funciones:

* Menú del sistema
* Cálculo de productividad

---

# 3. IMPLEMENTACIÓN DEL MODELO DEL MUNDO

Para esta primera entrega se implementa un producto mínimo viable utilizando programación orientada a objetos en Python. Se desarrollan las clases Tarea, GestorTareas y Sistema, incluyendo sus atributos y métodos principales.

El sistema permite:

* Crear tareas
* Listar tareas
* Marcar tareas como completadas
* Eliminar tareas
* Calcular prioridad automáticamente
* Generar recomendaciones
* Mostrar productividad

La interacción se realiza por consola, cumpliendo con lo requerido para esta fase del proyecto.

---

# 4. ENTREGA DEL TRABAJO

El proyecto incluye:

* Documento con el análisis del problema, requisitos funcionales y modelo UML
* Implementación del sistema en Python
* Repositorio en GitHub con el código fuente

---

# 5. CUMPLIMIENTO DE RESTRICCIONES

El sistema no es trivial, ya que no se limita a recibir y mostrar datos, sino que incorpora lógica para el análisis de tareas y apoyo en la toma de decisiones.

Se incluyen tres funcionalidades innovadoras, una por cada integrante del grupo: priorización inteligente, sistema de recomendación y análisis de productividad.

Se hace uso de la librería externa datetime para el manejo de fechas.

El trabajo en equipo se evidencia mediante el uso de GitHub y el historial de commits.

Todo el código desarrollado puede ser sustentado por los integrantes del grupo.
