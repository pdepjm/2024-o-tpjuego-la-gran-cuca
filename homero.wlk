import wollok.game.*
import comida.*
import niveles.*

object homero{
  var puntos = 0
  var velocidad = 1
  var position = new MutablePosition(x=(game.width()/2).roundUp(), y=0)
  var ultimaComida = rosquilla

  method velocidad() = velocidad

  method ultimaComida(comida){
    ultimaComida = comida
  }

  method positionX(nueva_pos_x){
    position = new MutablePosition(x=nueva_pos_x, y=0)
  }

  method come(comida) {
    ultimaComida = comida
    self.puntos(comida.puntos())
    self.velocidad(comida.velocidad())
  }

  method position() = position

  method setPuntos(nuevosPuntos){
    puntos = nuevosPuntos
    juego.verificarFinDeNivel()
  }

  method setVelocidad(x){
    velocidad = x
  }

  method moverseIzquierda(){
    ultimaComida.moverseAtras(position)
  }  

  method moverseDerecha(){
    ultimaComida.moverseAdelante(position)
  }


  method puntos(nuevosPuntos){
    puntos += nuevosPuntos
    puntos = puntos.max(0)
  }

  method velocidad(nuevaVelocidad){
    velocidad += nuevaVelocidad
  }

  method puntos() = puntos
  
  method image() = "homero-"+ ultimaComida.image()
}

// Usar bastante polimorfismo. Podemos usarlo con los objetos que caen (las caracteristicas de los objetos, comportamientios, efectos sobre Homero, puntos, 
// si tiene un efecto de mejora o peora sobre Homero que le cambie la imagen de él), la imagen de fondo por cada nivel, (efectos de sonido, musica para mas adelante)
// Ivo da permiso para repetir el permiso "bajá" -> Importante
// Dos niveles con fondos distintos (idealmente)
// Para pasar de nivel tenemos que matar el código del 1er nivel para se que incorpore el siguiente y asi sucesivamente 
// No poner en Tests colisiones o ticks
