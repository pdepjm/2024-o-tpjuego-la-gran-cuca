import wollok.game.*

object puntosHomero {
  const hom = homero
  const position = new MutablePosition(x=7, y=9)

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
  var velocidad = 1
  const position = new MutablePosition(x=7, y=0)
  const limitRightPosition = new MutablePosition (x=14, y=0)
  const limitLeftPosition = new MutablePosition (x=0, y=0)

  method image() = "homero.png"
  method position() = position

//
  method moverseIzquierda(){
    if(position != limitLeftPosition)
    position.goLeft(velocidad)
  }  

  method moverseDerecha(){
    if(position != limitRightPosition){
    position.goRight(velocidad)
    }
  }
//

/*
  method moverseIzquierda(){
    position.goLeft(velocidad)
  }  
  method moverseDerecha(){
    position.goRight(velocidad)
  }
*/
  method alterarPuntos(nuevosPuntos){
    puntos += nuevosPuntos
    puntos = puntos.max(0)
  }

  method alterarVelocidad(nuevaVelocidad){
    velocidad += nuevaVelocidad
    velocidad = velocidad.max(1)
  }

  method puntos() = puntos

  method velocidad() = velocidad
}

// Averiguar cómo poder configurar el tamaño de pixeles que abarca un objeto (en este caso, la Rosquilla y la Banana)
class Rosquilla {
  const position = new MutablePosition(x=0, y=0)
  const puntos = 10
  const velocidad = 1 

  method position() = position
  method image() = "rosquilla.png"
  method puntos () = puntos
  method velocidad () = velocidad
}

class Banana {
  const position = new MutablePosition(x=game.width()-3, y=0)
  const puntos = -5
  const velocidad = -1 

  method position() = position
  method image() = "banana.png"
  method puntos () = puntos
  method velocidad () = velocidad
}

// Usar bastante polimorfismo. Podemos usarlo con los objetos que caen (las caracteristicas de los objetos, comportamientios, efectos sobre Homero, puntos, 
// si tiene un efecto de mejora o peora sobre Homero que le cambie la imagen de él), la imagen de fondo por cada nivel, (efectos de sonido, musica para mas adelante)
// Ivo da permiso para repetir el permiso "bajá" -> Importante
// Dos niveles con fondos distintos (idealmente)
// Para pasar de nivel tenemos que matar el código del 1er nivel para se que incorpore el siguiente y asi sucesivamente 
// No poner en Tests colisiones o ticks
