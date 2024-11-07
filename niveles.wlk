import homero.*
import comida.*
import tableros.*
import wollok.game.*
import fondos.*


object juego {
    var nivelActual = nivel1
    var velocidad = 1 
    var contador = 0

    method contador () = contador

    method sumarContador(){
        contador = contador + 100
    }

    method verificarFinDeNivel(){
        nivelActual.verificarFinDeNivel()
        if(nivelActual.estado() == "ganado"){
            nivelActual = nivel2
        }
    }

    method actualizarCaida(){
        game.removeTickEvent("baja")
        self.nivelActual().bajarComidas()
    }

    method nivelActual() = nivelActual

    method velocidad(x){
        velocidad = x
    }

    method velocidad() = velocidad
}

const nivel1 = new Nivel()

class Nivel{
    var estado = "inicio"

    method estado() = estado

    method estado(x) {
      estado = x
    }

    method bajarComidas(){
        //lvl1
        game.onTick(rosquilla.velocidadCaida()* juego.velocidad(), "baja", {rosquilla.bajar()})
        game.onTick(cerveza.velocidadCaida()* juego.velocidad(), "baja", {cerveza.bajar()})
        game.onTick(banana.velocidadCaida()* juego.velocidad(), "baja", {banana.bajar()})
        game.onTick(plutonio.velocidadCaida()* juego.velocidad(), "baja", {plutonio.bajar()})
        game.onTick(silla.velocidadCaida()* juego.velocidad(), "baja", {silla.bajar()})
    }

    method inicializarValores(){
        homero.puntos(0)
        juego.velocidad(1)
        homero.ultimaComida(rosquilla)
        tiempo.timer(5*60)
        homero.positionX(game.width()/2)
        comidasNivel1.forEach({comida => comida.positionX((0..game.width()-2).anyOne())})
    }


    method iniciarFondo(){
        game.title("Homero en Springfield")
        //meter en otro lado
        game.height(12)
        game.width(18)
        game.cellSize(100)

        game.boardGround("springfield.png")
        //
        game.addVisual(puntosHomero)
        game.addVisual(mensajes)
        game.addVisual(homero)
        game.addVisual(tiempo)
        self.inicializarValores()

        game.start()
    }

    //Hardcodear los valores de las comidas
    //Que el ontick sea global y que el juego.velocidad() sea como un contador de ticks, en el que si pasa cierto tiempo
    //baja la comida (para que se actualice en el juego)
    
    //ACA: Un solo onTick que haga bajar todas las comidas, que tendrías un IF que cada cierta cantidad de onTicks. El onTick tiene que ser global del juego. 
    //Contador de tick, un valor que se calcula de la propia velocidad y de la velocidad de la comida, y eso que sea divisor del contador que tengo. 
    //hacer que los asserts sean mas lindos, corregir la velocidad

    method iniciarNivel(){
        self.estado("jugando")
        game.removeVisual(mensajes)
        comidasNivel1.forEach({comida => game.addVisual(comida)})

        keyboard.a().onPressDo({homero.moverseIzquierda()})
        keyboard.d().onPressDo({homero.moverseDerecha()})


        self.bajarComidas() 

        game.onCollideDo(homero, {cosa => cosa.interactua(homero)})
        
        game.onTick(1000, "restarSegundo", {tiempo.restarSegundo()})
    }

    method verificarFinDeNivel(){
        if (tiempo.timer() <= 0 || homero.puntos() >= 100)  {
            self.finalizarNivel()
        }
    }

    method finalizarNivel(){
        game.removeTickEvent("baja")
        game.removeTickEvent("restarSegundo")
        self.limpiarJuego()
        if(homero.puntos() < 100){
            game.addVisual(mensajeDerrota)
            self.estado("perdido")
        }else{
            game.addVisual(mensajeVictoria)
            game.addVisual(mensajeParaNivel2)
            self.estado("ganado")
            nivel2.estado("inicio")
            nivel2.inicializarValores()
            nivel2.iniciarFondo()
            keyboard.num2().onPressDo({nivel2.iniciarNivel()})
        }
    }

    method limpiarJuego(){
        game.allVisuals().forEach({visual=>game.removeVisual(visual)})
    }

}

object nivel2 inherits Nivel(estado = "espera"){

    override method bajarComidas(){
        //lvl1
        game.onTick(rosquilla.velocidadCaida() * juego.velocidad() * 2, "baja", {rosquilla.bajar()})
        game.onTick(cerveza.velocidadCaida()* juego.velocidad() * 2, "baja", {cerveza.bajar()})
        game.onTick(banana.velocidadCaida()* juego.velocidad() * 2, "baja", {banana.bajar()})
        game.onTick(plutonio.velocidadCaida()* juego.velocidad() * 2, "baja", {plutonio.bajar()})
        game.onTick(silla.velocidadCaida()* juego.velocidad() * 2, "baja", {silla.bajar()})

        //lvl2
        game.onTick(mate.velocidadCaida() * juego.velocidad(), "baja", {mate.bajar()})
        game.onTick(te.velocidadCaida() * juego.velocidad() , "baja", {te.bajar()})
        game.onTick(ensalada.velocidadCaida() * juego.velocidad(), "baja", {ensalada.bajar()})
        game.onTick(guiso.velocidadCaida() * juego.velocidad() , "baja", {guiso.bajar()})
    }

    override method iniciarFondo(){
        game.title("Homero en El Obelisco")

        game.removeVisual(mensajeParaNivel2)
        game.removeVisual(mensajeVictoria)

        game.addVisual(obelisco)

        game.addVisual(puntosHomero)
        game.addVisual(mensajeParaNivel2)
        game.addVisual(homero)
        game.addVisual(tiempo)
    }

    override method iniciarNivel(){
        self.estado("jugando")
        game.removeVisual(mensajeParaNivel2)
        comidasNivel2.forEach({comida => game.addVisual(comida)})

        self.bajarComidas()
    
        game.onTick(1000, "restarSegundo", {tiempo.restarSegundo()})
    }

    override method finalizarNivel(){
        game.removeTickEvent("baja")
        game.removeTickEvent("restarSegundo")
        self.limpiarJuego()
        if(homero.puntos() < 100){
            game.addVisual(mensajeDerrota)
            self.estado("perdido")
        }else{
            game.addVisual(mensajeVictoria)
            self.estado("ganado")
        }
    }

}



