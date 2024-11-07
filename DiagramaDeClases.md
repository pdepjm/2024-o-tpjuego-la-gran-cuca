# DIAGRAMA DE CLASES #

Homero interactúa con diferentes tipos de comida, modificando su imagen y puntuación en base a la comida que consume, 
sea para ventaja o desventaja del jugador. Además, la misma comida que aumenta la puntuacion de homero hace que aumente o disminuya la velocidad del juego que en sí aumenta o disminuye la caida de todos los alimentos a medida que se desarrolla el nivel. Dependiendo del nivel en el que se encuentre se modificará la dificultad de jugabilidad. 

Los objetos "Homero" y "Comida" encapsulan su estado interno (variables como puntos, velocidad, estado de Homero, y nombre, puntos, velocidad de Comida) y solo permiten modificarlo a través de métodos. Por ejemplo, el método “puntos(nuevosPuntos)” de Homero permite cambiar su puntuación asegurando que no sea negativa. 

Homero se abstrae como una entidad que puede moverse y cambiar de estado, mientras que las comidas son abstraídas con comportamientos específicos que afectan solo a Homero. Los métodos como “moverseIzquierda” e “interactúa” esconden detalles de implementación.

El método “interactúa” de la clase Comida es un ejemplo de polimorfismo cuando interactúa con diferentes tipos de comidas, creando diferentes comportamientos en Homero. Dependiendo del tipo de comida (por ejemplo, rosquilla, banana, plutonio) homero cambia sus propiedades de maneras diferentes, cambia su imagen, sus puntos y en algunos casos (como en el de la cerveza) sus movimientos, es decir que si se intenta mover para la izquierda homero irá hacia la derecha.

Pueden existir objetos letales, como la silla, si homero interactúa con una silla de plastico, lo más probable es que esta lo traicione y termine con la partida inmediatamente.

![image](https://github.com/user-attachments/assets/6bd0ffe8-0580-419d-8520-d92c076d3879)


