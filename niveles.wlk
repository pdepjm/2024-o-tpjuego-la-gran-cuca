import homero.*
import comida.*
import tableros.*
import wollok.game.*
import fondos.*

//Estados : inicio, jugando, finalizado

object nivel1 { 
    var estado = "inicio"

    method estado() = estado

    method setEstado(x) {
      estado = x
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

        game.start()

    }

    method iniciarNivel(){
        self.setEstado("jugando")
        game.onTick(1000, "restarSegundo", {tiempo.restarSegundo()})
        game.onTick(1000, "finalizarNivel", {if(tiempo.timer() <= 0 || homero.puntos() >= 100) self.finalizarNivel()})
        game.removeVisual(mensajes)
        comidasNivel1.forEach({comida => game.addVisual(comida)})

        game.onTick(1700, "baja", {rosquilla.bajar()})
        game.onTick(1200, "baja", {banana.bajar()})
        game.onTick(700, "baja", {choripan.bajar()})
        game.onTick(1450, "baja", {cerveza.bajar()})
        game.onTick(950, "baja", {plutonio.bajar()})

        keyboard.a().onPressDo({homero.moverseIzquierda()})
        keyboard.d().onPressDo({homero.moverseDerecha()})

        keyboard.space().onPressDo{
            const colliders = game.colliders(homero)
            if(colliders.head()!=null){
                colliders.head().interactua(homero)
                homero.alterarPuntos(colliders.head().puntos())
                homero.alterarVelocidad(colliders.head().velocidad())
                game.removeVisual(colliders.head())
            }
        }

    }

    method finalizarNivel(){
        self.limpiarJuego()
        game.removeTickEvent("baja")
        game.removeTickEvent("restarSegundo")
        game.removeTickEvent("finalizarNivel")
        if(homero.puntos() < 100){
            game.addVisual(mensajeDerrota)
            self.setEstado("finalizado")
        }else{
            game.addVisual(mensajeVictoria)
            game.addVisual(mensajeParaNivel2)
            self.setEstado("finalizado")
            nivel2.setEstado("inicio")
        }
    }

    method limpiarJuego(){
        game.allVisuals().forEach({visual=>game.removeVisual(visual)})
    }

}

//Estados nivel2 : espera,inicio, jugando, finalizado

object nivel2{
    var estado = "espera"

    method setEstado(x){
        estado = x
    }

    method estado() = estado

    method inicializarValores(){
        homero.setPuntos(0)
        homero.setVelocidad(2)
        tiempo.setTimer(5*60)
        if(homero.position().x()>8){
            homero.position().goLeft(homero.position().x()-8)
        }else if(homero.position().x()<8){
            homero.position().goRight(8-homero.position().x())
        }
        homero.poneteGrasoso()
        comidasNivel1.forEach({comida => comida.position().goUp(18)})
    }

    method iniciarFondo(){
        game.title("Homero en El Obelisco")
        game.height(12)
        game.width(18)
        game.cellSize(100)

        game.removeVisual(mensajeParaNivel2)
        game.removeVisual(mensajeVictoria)
        
        game.addVisual(obelisco)

        game.addVisual(puntosHomero)
        game.addVisual(mensajeParaNivel2)
        game.addVisual(homero)
        game.addVisual(tiempo)

        game.start()

    }

    method iniciarNivel(){
        self.setEstado("jugando")
        game.onTick(1000, "restarSegundo", {tiempo.restarSegundo()})
        game.onTick(1000, "finalizarNivel", {if(tiempo.timer() <= 0 || homero.puntos() >= 100) self.finalizarNivel()})
        game.removeVisual(mensajeParaNivel2)
        comidasNivel2.forEach({comida => game.addVisual(comida)})

        game.onTick(450, "baja", {mate.bajar()})
        game.onTick(700, "baja", {choripan.bajar()})
        game.onTick(1200, "baja", {banana.bajar()})
        game.onTick(950, "baja", {plutonio.bajar()})
        game.onTick(1450, "baja", {cerveza.bajar()})
        game.onTick(1700, "baja", {rosquilla.bajar()})
        game.onTick(1950, "baja", {te.bajar()})
        game.onTick(2200, "baja", {ensalada.bajar()})
        game.onTick(2450, "baja", {guiso.bajar()})

        keyboard.a().onPressDo({homero.moverseIzquierda()})
        keyboard.d().onPressDo({homero.moverseDerecha()})

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

        method finalizarNivel(){
        self.limpiarJuego()
        game.removeTickEvent("baja")
        game.removeTickEvent("restarSegundo")
        game.removeTickEvent("finalizarNivel")
        if(homero.puntos() < 100){
            game.addVisual(mensajeDerrota)
            self.setEstado("finalizado")
        }else{
            game.addVisual(mensajeVictoria)
            self.setEstado("finalizado")
        }
    }

    method limpiarJuego(){
        game.allVisuals().forEach({visual=>game.removeVisual(visual)})
    }


}

