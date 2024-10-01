import wollok.game.*

object puntosHomero {
  const hom = homero
  const position = new MutablePosition(x=7, y=9)

  method position() = position

  method text () = "Puntos: " + hom.puntos() + " Velocidad: " + hom.velocidad()

}

object homero{
  var puntos = 0
  var velocidad = 1
  const position = new MutablePosition(x=7, y=0)

  method image() = "homero.png"
  method position() = position

  method moverseIzquierda(){
    position.goLeft(velocidad)
  }

  method moverseDerecha(){
    position.goRight(velocidad)
  }

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
  const position = new MutablePosition(x=game.width()-2, y=0)
  const puntos = -5
  const velocidad = -1 

  method position() = position
  method image() = "banana.png"
  method puntos () = puntos
  method velocidad () = velocidad
}

