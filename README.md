# Digitalización. Memoria 3º Trimestre

## INTRODUCCIÓN

El objetivo final de este proyecto ha sido aprender cómo aplicar la IA en un entorno de videojuego, en este caso el clásico juego de Chrome Dino Runner.  
En lugar de controlar el jugador al dinosaurio, este es controlado por una red neuronal de evolución progresiva.



## [GitHub](https://github.com/AgcioVF/IADigi.git)

## DESARROLLO

El desarrollo de este proyecto sufrió numerosos problemas durante los dos primeros trimestres, estando estados detallados en las memorias previamente entregadas, por lo que vamos a enfocarnos en el progreso de este último.

### Planteamiento inicial

Replicar una versión jugable del Dino Runner en Python (PyCharm).  
Implementación de la IA mediante el algoritmo evolutivo **NEAT**.

Decidí decantarme por un proyecto de este estilo por el auge actual de la IA y por la oportunidad de familiarizarme con un nuevo lenguaje de programación.

### Desarrollo del juego base

#### Librerías:

| Librería | Descripción |
|----------|-------------|
| `pygame` | Desarrollar videojuegos 2D. Permite manejar gráficos, sonidos, eventos… de forma sencilla. |
| `os`     | Funciones para interactuar con el sistema operativo. |
| `random` | Funciones para generar números aleatorios. |
| `math`   | Funciones matemáticas avanzadas. |
| `sys`    | Acceso a variables y funciones del sistema. |

#### Objetos del juego

- **Jugador (Dinosaurio)**:
  - Desplazamiento horizontal continuo.
  - Salto, gravedad y velocidad incremental.
  - Colisiones con obstáculos.

- **Obstáculos**:
  - Aparición aleatoria.
  - Movimiento sincronizado con la velocidad del juego.

- **Pantalla**:
  - Sistema de puntuación.
  - Visualización de sprites de los dinosaurios y obstáculos.

#### Implementación del algoritmo NEAT

El algoritmo **NEAT (NeuroEvolution of Augmenting Topologies)** permite entrenar redes neuronales de forma evolutiva. Cada dinosaurio es controlado por una red neuronal que toma decisiones basadas en el entorno del juego.

##### Librerías

- **neat**: Librería que implementa el algoritmo NEAT, creando redes neuronales que evolucionan a lo largo de múltiples generaciones.

##### Configuración de NEAT (`config.txt`)

- **Input**:
  - Distancia al próximo obstáculo.
  - Velocidad actual del juego.

- **Output**:
  - Decisión de salto (sí/no).

- **Parámetros ajustables**:
  - Tamaño de la población: 100.
  - Umbral de compatibilidad: 3.0.
  - Mutaciones y conexiones iniciales para fomentar la diversidad.

#### Código relevante: Activación de la IA para el salto del dinosaurio

En la función de evaluación de las redes neuronales, cada dinosaurio toma decisiones basadas en su entorno:

python
```
output = nets[i].activate((dinosaur.rect.y, distance((dinosaur.rect.x, dinosaur.rect.y), obstacle.rect.midtop)))
if output[0] > 0.5 and dinosaur.rect.y == dinosaur.Y_POS:
    dinosaur.dino_jump = True
    dinosaur.dino_run = False
```

## Resultados obtenidos

- La IA es capaz de jugar de forma autónoma, tomando decisiones en tiempo real.
- La IA puede superar obstáculos a velocidades incrementales, adaptándose a cambios en la dinámica del juego.
- Se han observado comportamientos emergentes, como pequeños saltos anticipados, sin que se hayan programado directamente, lo que indica un aprendizaje efectivo.

La implementación del algoritmo NEAT permitió que los dinosaurios desarrollaran estrategias diversas para evitar obstáculos, mostrando cómo las redes neuronales evolucionan y se adaptan a situaciones complejas. La capacidad de la IA para anticiparse a ciertos obstáculos y modificar su comportamiento a medida que avanzaba es un claro ejemplo de la evolución de agentes inteligentes en un entorno controlado.

## Conclusiones

Este proyecto demuestra cómo la Inteligencia Artificial, a través de algoritmos como NEAT, puede aplicarse de manera efectiva en videojuegos para crear agentes autónomos capaces de aprender y adaptarse al entorno. A lo largo del desarrollo, se han enfrentado diversos desafíos técnicos, pero los resultados obtenidos han validado el uso de redes neuronales evolutivas para juegos como Dino Runner.

### Futuras mejoras

A pesar de los buenos resultados, siempre hay margen de mejora:

- **Optimización del rendimiento**: A medida que el número de dinosaurios en la simulación aumenta, es posible que se necesiten optimizaciones adicionales para mantener la fluidez del juego.
- **Entrenamiento más largo**: Permitir que la IA entrene por más tiempo podría llevar a una mejora en la habilidad para superar obstáculos a mayor velocidad.
- **Interacción avanzada**: Incorporar interacciones más complejas entre los dinosaurios y el entorno, como la interacción con otros dinosaurios o una mayor variedad de obstáculos.

### Bibliografía

- Redes Neuronales, Contenido teórico. Universidad de Sevilla.
- Aprendizaje automático, Contenido teórico. Universidad de Sevilla.
- Planificación automática, Contenido teórico. Universidad de Sevilla.
- Procesamiento del lenguaje natural, Contenido teórico. Universidad de Sevilla.
- **Redes Neuronales: Guía Sencilla de Redes Neuronales Artificiales** (Rudolph Russel)
- Wikipedia
- ChatGPT
