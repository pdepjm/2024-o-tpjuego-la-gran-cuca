# DIAGRAMA DE CLASES #

Homero interactúa con diferentes tipos de comida, modificando su estado, velocidad y puntuación en base a la comida que consume, 
sea para ventaja o desventaja del jugador. Dependiendo del nivel en el que se encuentre se modificará la dificultad de jugabilidad. 

Los objetos "Homero" y "Comida" encapsulan su estado interno (variables como puntos, velocidad, estado de Homero, y nombre, puntos, 
velocidad de Comida) y solo permiten modificarlo a través de métodos. Por ejemplo, el método “alterarPuntos” de Homero permite cambiar 
su puntuación asegurando que no sea negativa. 

Homero se abstrae como una entidad que puede moverse y cambiar de estado, mientras que las comidas son abstraídas con comportamientos 
específicos que afectan solo a Homero. Los métodos como “moverseIzquierda” e “interactúa” esconden detalles de implementación.

El método “interactúa” de la clase Comida es un ejemplo de polimorfismo cuando interactúa con diferentes tipos de comidas, 
creando diferentes comportamientos en Homero. Dependiendo del tipo de comida (por ejemplo, rosquilla, banana, plutonio), 
se invoca un método diferente en homero, alterando su estado y propiedades. Este comportamiento permite que múltiples tipos de "comida" 
compartan el mismo método de interacción, pero con efectos distintos.

![image](https://github.com/user-attachments/assets/3fa26ba5-d166-4a50-9f13-15494f9e98f0)

