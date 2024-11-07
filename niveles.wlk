import homero.*
import comida.*
import tableros.*
import wollok.game.*
import fondos.*

//Estados : inicio, jugando, finalizado
// TODO: pensar la estructura general de cada nivel, y lo que difiere.
// No repetir lo general. -> Pista, seguro usarán clases. 
// Pista: quizás la herencia pueda ayudar también.
// No repetir nada de lógica.

object juego {
    var nivelActual = nivel1
    var velocidad = 1 

    method verificarFinDeNivel(){
        nivelActual.verificarFinDeNivel()
        if(nivelActual.estado() == "ganado"){
            nivelActual = nivel2
        }
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
    
    method iniciarNivel(){
        self.estado("jugando")
        game.removeVisual(mensajes)
        comidasNivel1.forEach({comida => game.addVisual(comida)})

        game.onTick(1000 * juego.velocidad(), "baja", {rosquilla.bajar()})
        game.onTick(800 * juego.velocidad() , "baja", {banana.bajar()})
        game.onTick(400 * juego.velocidad() , "baja", {choripan.bajar()})
        game.onTick(900 * juego.velocidad() , "baja", {cerveza.bajar()})
        game.onTick(500 * juego.velocidad() , "baja", {plutonio.bajar()})
        game.onTick(200 * juego.velocidad() , "baja", {silla.bajar()})

        keyboard.a().onPressDo({homero.moverseIzquierda()})
        keyboard.d().onPressDo({homero.moverseDerecha()})

        game.onCollideDo(homero, {cosa => cosa.interactua(homero) })
        
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
        //lvl2
        game.onTick(1200 * juego.velocidad(), "baja", {mate.bajar()})
        game.onTick(500 * juego.velocidad() , "baja", {te.bajar()})
        game.onTick(600 * juego.velocidad(), "baja", {ensalada.bajar()})
        game.onTick(1500 * juego.velocidad() , "baja", {guiso.bajar()})
        //lvl1
        game.onTick(1200 * juego.velocidad(), "baja", {rosquilla.bajar()})
        game.onTick(1300 * juego.velocidad() , "baja", {banana.bajar()})
        game.onTick(1400 * juego.velocidad() , "baja", {choripan.bajar()})
        game.onTick(800 * juego.velocidad() , "baja", {cerveza.bajar()})
        game.onTick(1000 * juego.velocidad() , "baja", {plutonio.bajar()})
        game.onTick(200 * juego.velocidad() , "baja", {silla.bajar()})
    
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

//Estados nivel2 : espera,inicio, jugando, finalizado


