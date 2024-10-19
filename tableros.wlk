import homero.*
import niveles.*
object puntosHomero {
  const hom = homero
  const position = new MutablePosition(x=9, y=10)

  method position() = position

  method text () = "Puntos: " + hom.puntos() + " Velocidad: " + hom.velocidad()

}

object mensajes {
    const position = new MutablePosition(x=9, y=8)
    
    method position() = position
    
    method text() = "Bienvenido a Homero en Springfield, presione 1 para comenzar el nivel 1!"
}

object tiempo {
    var timer = 5 * 60
    const position = new MutablePosition(x=9, y=9)
    
    method position() = position
    
    method text() = "Tiempo: " + timer

    method timer() = timer

    method setTimer(nuevoTiempo){
        timer = nuevoTiempo
    }

    method restarSegundo(){
        timer -= 1
        juego.verificarFinDeNivel()
    }
}

object mensajeVictoria{
    const position = new MutablePosition(x=9, y=8)
    
    method position() = position
    
    method text() = "Ganaste!"
}

object mensajeDerrota{
    const position = new MutablePosition(x=9, y=8)
    
    method position() = position
    
    method text() = "Perdiste!"
}

object mensajeParaNivel2{
    const position = new MutablePosition(x=9, y=6)
    
    method position() = position
    
    method text() = "Presione 2 para comenzar el nivel 2"
}

object bienvenidaNivel2 {
    const position = new MutablePosition(x=9, y=8)
    
    method position() = position
    
    method text() = "Bienvenido al nivel 2, homero en el obelisco presione 2 para comenzar!"
}