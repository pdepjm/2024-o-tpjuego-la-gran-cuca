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
    const nivelActual = nivel1

    method verificarFinDeNivel(){
        nivelActual.verificarFinDeNivel()
    }
}

const nivel1 = new Nivel()

class Nivel{
    var estado = "inicio"

    method estado() = estado

    method setEstado(x) {
      estado = x
    }

    method inicializarValores(){
        homero.setPuntos(0)
        homero.setVelocidad(1)
        homero.ultimaComida(rosquilla)
        tiempo.setTimer(5*60)
        if(homero.position().x()>8){
            homero.position().goLeft(homero.position().x()-8)
        }else if(homero.position().x()<8){
            homero.position().goRight(8-homero.position().x())
        }
    }


    method iniciarFondo(){
        game.title("Homero en Springfield")
        game.height(12)
        game.width(18)
        game.cellSize(100)

        game.boardGround("springfield.png")
        game.addVisual(puntosHomero)
        game.addVisual(mensajes)
        game.addVisual(homero)
        game.addVisual(tiempo)
        self.inicializarValores()

        game.start()
    }

    
    method iniciarNivel(){
        self.setEstado("jugando")
        game.removeVisual(mensajes)
        comidasNivel1.forEach({comida => game.addVisual(comida)})

        game.onTick(1700 + homero.velocidad(), "baja", {rosquilla.bajar()})
        game.onTick(1200 + homero.velocidad() , "baja", {banana.bajar()})
        game.onTick(700 + homero.velocidad() , "baja", {choripan.bajar()})
        game.onTick(1450 + homero.velocidad() , "baja", {cerveza.bajar()})
        game.onTick(950 + homero.velocidad() , "baja", {plutonio.bajar()})

        keyboard.a().onPressDo({homero.moverseIzquierda()})
        keyboard.d().onPressDo({homero.moverseDerecha()})

        game.onCollideDo(homero, {cosa => cosa.interactua(homero)})
        
        game.onTick(1000, "restarSegundo", {tiempo.restarSegundo()})
    }

    method verificarFinDeNivel(){
        if (tiempo.timer() <= 0 || homero.puntos() >= 100)  {
            self.finalizarNivel()
        }
    }

    method finalizarNivel(){
        game.removeTickEvent("finalizarNivel")
        game.removeTickEvent("baja")
        game.removeTickEvent("restarSegundo")
        self.limpiarJuego()
        if(homero.puntos() < 100){
            game.addVisual(mensajeDerrota)
            self.setEstado("finalizado")
        }else{
            game.addVisual(mensajeVictoria)
            game.addVisual(mensajeParaNivel2)
            self.setEstado("finalizado")
            nivel2.setEstado("inicio")
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

    override method inicializarValores(){
        homero.setPuntos(0)
        homero.setVelocidad(1)
        tiempo.setTimer(5*60)
        if(homero.position().x()>8){
            homero.position().goLeft(homero.position().x()-8)
        }else if(homero.position().x()<8){
            homero.position().goRight(8-homero.position().x())
        }
        comidasNivel1.forEach({comida => comida.position().goUp(18)})
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
        self.setEstado("jugando")
        game.onTick(1000, "restarSegundo", {tiempo.restarSegundo()})
        game.onTick(1000, "finalizarNivel", {if((tiempo.timer() <= 0 || homero.puntos() >= 100) && self.estado()!="finalizado") self.finalizarNivel()})
        game.removeVisual(mensajeParaNivel2)
        comidasNivel2.forEach({comida => game.addVisual(comida)})

        game.onTick(450 + homero.velocidad(), "baja", {mate.bajar()})
        game.onTick(700 + homero.velocidad(), "baja", {choripan.bajar()})
        game.onTick(1200 + homero.velocidad(), "baja", {banana.bajar()})
        game.onTick(950 + homero.velocidad(), "baja", {plutonio.bajar()})
        game.onTick(1450 + homero.velocidad(), "baja", {cerveza.bajar()})
        game.onTick(1700 + homero.velocidad(), "baja", {rosquilla.bajar()})
        game.onTick(1950 + homero.velocidad() , "baja", {te.bajar()})
        game.onTick(2200 + homero.velocidad(), "baja", {ensalada.bajar()})
        game.onTick(2450 + homero.velocidad() , "baja", {guiso.bajar()})



        keyboard.space().onPressDo{
            const colliders = game.colliders(homero)
            if(colliders.head() != null){
                colliders.head().interactua(homero)
                homero.alterarPuntos(colliders.head().puntos())
                homero.alterarVelocidad(colliders.head().velocidad())
                game.removeVisual(colliders.head())
            }
        }

    }
}

//Estados nivel2 : espera,inicio, jugando, finalizado


