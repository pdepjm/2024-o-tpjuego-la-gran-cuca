import wollok.game.*

object puntosHomero {
  const hom = homero
  const position = new MutablePosition(x=9, y=10)

  method position() = position

  method text () = "Puntos: " + hom.puntos() + " Velocidad: " + hom.velocidad()

}

/* NO ANDA JAJA
object mapMoves {
  const limitRightPosition = new MutablePosition (x=14, y=0)
  const limitLeftPosition = new MutablePosition (x=0, y=0)

method movimiento(){
    if (homero.position != limitLeftPosition){
      homero.position.goLeft(homero.velocidad)
    }
    if (homero.position != limitRightPosition)
    {
      homero.position.goRight(homero.velocidad)
    }
  }
}
*/

object homero{
  var puntos = 0
  var velocidad = 2
  const position = new MutablePosition(x=8, y=0)
  var estado = new Rosquilla()

  method position() = position

//
  method moverseIzquierda(){
    if(position.x() >= 0 && position.x() - velocidad >= 0)
      position.goLeft(velocidad)
  }  

  method moverseDerecha(){
    if(position.x() <= 16 && position.x() + velocidad <= 16)
      position.goRight(velocidad)
  }

  method alterarPuntos(nuevosPuntos){
    puntos += nuevosPuntos
    puntos = puntos.max(0)
  }

  method alterarVelocidad(nuevaVelocidad){
    velocidad += nuevaVelocidad
    velocidad = velocidad.max(2)
  }

  method puntos() = puntos

  method velocidad() = velocidad

  method poneteGrasoso() { estado = new Rosquilla() }
  method poneteRadiactivo() { estado = new Plutonio() }
  method convertiteEnMono() { estado = new Banana() }
  method cometeUnChoripan() { estado = new Choripan() }
  method tomateUnMate() { estado = new Mate() }
  method tomateUnaCerveza() { estado = new Cerveza() }
  method tomateUnTe() { estado = new Te() }
  method comeEnsalada() { estado = new Ensalada() }
  method poneteObeso() { estado = new Guiso() }

  method estaGrasoso() = estado.nombre() == "rosquilla"
  method estaRadiactivo() = estado.nombre() == "plutonio"
  method estaMono() = estado.nombre() == "banana"
  method estaEnAsado() = estado.nombre() == "choripan"
  method estaTomandoMate() = estado.nombre() == "mate"
  method estaTomandoCerveza() = estado.nombre() == "cerveza"
  method estaTomandoTe() = estado.nombre() == "te"
  method estaComiendoEnsalada() = estado.nombre() == "ensalada"
  method estaObeso() = estado.nombre() == "guiso"


	
	method image() = "homero-" + estado.nombre() + ".png"

}

class Rosquilla {
  var property nombre = "rosquilla"
  const position = new MutablePosition(x= (0..8).anyOne()*2, y=16)
  const puntos = 10
  const velocidad = 2 

  method position() = position
  method image() = "rosquilla.png"
  method puntos () = puntos
  method velocidad () = velocidad

  method bajar (){
    if (position.y() >= -2){
      position.goDown(2)
    }
  }

  method interactua(homero) { homero.poneteGrasoso()}

}

class Banana {
  var property nombre = "banana"
  const position = new MutablePosition(x=(0..8).anyOne()*2, y=16)
  const puntos = -5
  const velocidad = -2 

  method position() = position
  method image() = "banana.png"
  method puntos () = puntos
  method velocidad () = velocidad

  method interactua(homero) { homero.convertiteEnMono()}

  method bajar (){
    if (position.y() >= -2){
      position.goDown(2)
    }
  }

}

class Plutonio{
  var property nombre = "plutonio"
  const position = new MutablePosition(x=(0..8).anyOne()*2, y=16)
  const puntos = 20
  const velocidad = -2

  method position() = position
  method image() = "plutonio.png"
  method puntos () = puntos
  method velocidad () = velocidad

  method interactua(homero) { homero.poneteRadiactivo() }

  method bajar (){
    if (position.y() >= -2){
      position.goDown(2)
    }
  }

}

class Choripan {
  var property nombre = "choripan"
  const position = new MutablePosition(x=(0..8).anyOne()*2, y=16)
  const puntos = 5
  const velocidad = 2

  method position() = position
  method image() = "choripan.png"
  method puntos () = puntos
  method velocidad () = velocidad

  method interactua(homero) { homero.cometeUnChoripan() }

  method bajar (){
    if (position.y() >= -2){
      position.goDown(2)
    }
  }

}

class Mate {
  var property nombre = "mate"
  const position = new MutablePosition(x=(0..8).anyOne()*2, y=16)
  const puntos = 100
  const velocidad = 4

  method position() = position
  method image() = "mate.png"
  method puntos () = puntos
  method velocidad () = velocidad

  method interactua(homero) { homero.tomateUnMate() }

  method bajar (){
    if (position.y() >= -2){
      position.goDown(2)
    }
  }

}

class Cerveza {
  var property nombre = "cerveza"
  const position = new MutablePosition(x=(0..8).anyOne()*2, y=16)
  const puntos = 50
  const velocidad = -4

  method position() = position
  method image() = "cerveza.png"
  method puntos () = puntos
  method velocidad () = velocidad

  method interactua(homero) { homero.tomateUnaCerveza() }

  method bajar (){
    if (position.y() >= -2){
      position.goDown(2)
    }
  }

}

class Te{
  var property nombre = "te"
  const position = new MutablePosition(x=(0..8).anyOne()*2, y=16)
  const puntos = -100
  const velocidad = -2

  method position() = position
  method image() = "te.png"
  method puntos () = puntos
  method velocidad () = velocidad

  method interactua(homero) { homero.tomateUnTe() }

  method bajar (){
    if (position.y() >= -2){
      position.goDown(2)
    }
  }

}

class Ensalada {
  var property nombre = "ensalada"
  const position = new MutablePosition(x=(0..8).anyOne()*2, y=16)
  const puntos = -20
  const velocidad = 2

  method position() = position
  method image() = "ensalada.png"
  method puntos () = puntos
  method velocidad () = velocidad

  method interactua(homero) { homero.comeEnsalada() }

  method bajar (){
    if (position.y() >= -2){
      position.goDown(2)
    }
  }

}

class Guiso {
  var property nombre = "guiso"
  const position = new MutablePosition(x=(0..8).anyOne()*2, y=16)
  const puntos = 80
  const velocidad = -6

  method position() = position
  method image() = "guiso.png"
  method puntos () = puntos
  method velocidad () = velocidad

  method interactua(homero) { homero.poneteObeso() }

  method bajar (){
    if (position.y() >= -2){
      position.goDown(2)
    }
  }

}



// Usar bastante polimorfismo. Podemos usarlo con los objetos que caen (las caracteristicas de los objetos, comportamientios, efectos sobre Homero, puntos, 
// si tiene un efecto de mejora o peora sobre Homero que le cambie la imagen de él), la imagen de fondo por cada nivel, (efectos de sonido, musica para mas adelante)
// Ivo da permiso para repetir el permiso "bajá" -> Importante
// Dos niveles con fondos distintos (idealmente)
// Para pasar de nivel tenemos que matar el código del 1er nivel para se que incorpore el siguiente y asi sucesivamente 
// No poner en Tests colisiones o ticks
