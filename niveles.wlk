import homero.*
import comida.*
import tableros.*
import wollok.game.*

object nivel1 { 
    method inciarFondo(){
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
        game.onTick(1000, "restarSegundo", {tiempo.restarSegundo()})
        game.removeVisual(mensajes)
        comidas.forEach({comida => game.addVisual(comida)})
/*
        game.onTick(250, "baja", {mate.bajar()})
        game.onTick(500, "baja", {choripan.bajar()})
        game.onTick(1000, "baja", {banana.bajar()})
        game.onTick(750, "baja", {plutonio.bajar()})
        game.onTick(1250, "baja", {cerveza.bajar()})
        game.onTick(1500, "baja", {rosquilla.bajar()})
        game.onTick(1750, "baja", {te.bajar()})
        game.onTick(2000, "baja", {ensalada.bajar()})
        game.onTick(2250, "baja", {guiso.bajar()})
*/
// Modifique la velocidad/constancia en la que caen los alimentos para que sea una caida mas normal
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
            colliders.head().interactua(homero)
            homero.alterarPuntos(colliders.head().puntos())
            homero.alterarVelocidad(colliders.head().velocidad())
            game.removeVisual(colliders.head())
            if(homero.puntos() >= 100 || tiempo.timer() <= 0){
                self.finalizarNivel()
            }
        }

    }

    method finalizarNivel(){
        game.clear()
        if(homero.puntos() < 100){
            game.addVisual(mensajeDerrota)
        }else{
            game.addVisual(mensajeVictoria)
        }
    }
}


