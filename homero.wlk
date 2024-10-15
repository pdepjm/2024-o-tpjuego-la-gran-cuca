import wollok.game.*
import comida.*

object puntosHomero {
  const hom = homero
  const position = new MutablePosition(x=9, y=10)

  method position() = position

  method text () = "Puntos: " + hom.puntos() + " Velocidad: " + hom.velocidad()

}

object homero{
  var puntos = 0
  var velocidad = 2
  const position = new MutablePosition(x=8, y=0)
  var estado = "rosquilla"

  method position() = position

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

  method cambiarEstado(nuevoEstado) {
    estado = nuevoEstado
  }

  method poneteGrasoso() {
    self.cambiarEstado("rosquilla")
  }

  method convertiteEnMono() {
    self.cambiarEstado("banana")
  }

  method poneteRadiactivo() {
    self.cambiarEstado("plutonio")
  }

  method cometeUnChoripan() {
    self.cambiarEstado("choripan")
  }

  method tomateUnMate() {
    self.cambiarEstado("mate")
  }

  method tomateUnaCerveza() {
    self.cambiarEstado("cerveza")
  }

  method tomateUnTe() {
    self.cambiarEstado("te")
  }

  method comeEnsalada() {
    self.cambiarEstado("ensalada")
  }

  method poneteObeso() {
    self.cambiarEstado("guiso")
  }
  
  method image() = "homero-"+ estado + ".png"

}

// Usar bastante polimorfismo. Podemos usarlo con los objetos que caen (las caracteristicas de los objetos, comportamientios, efectos sobre Homero, puntos, 
// si tiene un efecto de mejora o peora sobre Homero que le cambie la imagen de él), la imagen de fondo por cada nivel, (efectos de sonido, musica para mas adelante)
// Ivo da permiso para repetir el permiso "bajá" -> Importante
// Dos niveles con fondos distintos (idealmente)
// Para pasar de nivel tenemos que matar el código del 1er nivel para se que incorpore el siguiente y asi sucesivamente 
// No poner en Tests colisiones o ticks
