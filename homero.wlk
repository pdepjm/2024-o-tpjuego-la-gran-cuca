import wollok.game.*
import comida.*
import niveles.*

object homero{
  var puntos = 0
  var position = new MutablePosition(x=(game.width()/2).roundUp(), y=0)
  var ultimaComida = rosquilla

  method ultimaComida(comida){
    ultimaComida = comida
  }

  method positionX(nueva_pos_x){
    position = new MutablePosition(x=nueva_pos_x, y=0)
  }

  method come(comida) {
    ultimaComida = comida
    juego.velocidad(comida.velocidad())
    juego.actualizarCaida()
    self.sumarPuntos(comida.puntos())
  }

  method position() = position

  method moverseIzquierda(){
    ultimaComida.moverseAtras(position)
  }  

  method moverseDerecha(){
    ultimaComida.moverseAdelante(position)
  }

  method puntos(nuevosPuntos){
    puntos = nuevosPuntos
    puntos = puntos.max(0)
    juego.verificarFinDeNivel()
  }

  method sumarPuntos(nuevosPuntos){
    puntos += nuevosPuntos
    puntos = puntos.max(0)
    juego.verificarFinDeNivel()
  }

  method puntos() = puntos
  
  method image() = "homero-"+ ultimaComida.image()
}
