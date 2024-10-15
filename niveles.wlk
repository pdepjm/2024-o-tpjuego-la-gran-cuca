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

        if(tiempo.timer() == 0 || homero.puntos() > 200){
            game.addVisual(mensajeVictoria)
            game.stop()
        }else if (tiempo.timer() == 0){
            game.addVisual(mensajeDerrota)
            game.stop()
        }
    }

    method iniciarNivel(){
        game.removeVisual(mensajes)
        game.onTick(1000, "descontar tiempo", {tiempo.restarSegundo()})
        game.onTick(1000, "tiempo en 0", {if(tiempo.timer() == 0) game.removeTickEvent("descontar tiempo")})
        game.onTick(1000, "tiempo en 0", {if(tiempo.timer() == 0) game.removeTickEvent("baja")})
        game.onTick(1000, "gano o no", {if(homero.puntos() > 200) game.addVisual(mensajeVictoria) else game.addVisual(mensajeDerrota)})

        comidas.forEach({comida => game.addVisual(comida)})

        game.onTick(500, "baja", {rosquilla.bajar()})
        game.onTick(1000, "baja", {banana.bajar()})
        game.onTick(750, "baja", {plutonio.bajar()})
        game.onTick(1250, "baja", {cerveza.bajar()})
        game.onTick(250, "baja", {choripan.bajar()})
        game.onTick(1500, "baja", {mate.bajar()})
        game.onTick(1750, "baja", {te.bajar()})
        game.onTick(2000, "baja", {ensalada.bajar()})
        game.onTick(2250, "baja", {guiso.bajar()})


        keyboard.a().onPressDo({homero.moverseIzquierda()})
        keyboard.d().onPressDo({homero.moverseDerecha()})

        keyboard.space().onPressDo{
            const colliders = game.colliders(homero)
            colliders.head().interactua(homero)
            homero.alterarPuntos(colliders.head().puntos())
            homero.alterarVelocidad(colliders.head().velocidad())
            game.removeVisual(colliders.head())
        }

        if(tiempo.timer() == 0 || homero.puntos() > 200){
            game.removeTickEvent("descontar tiempo")
            game.removeTickEvent("baja")
        }

    }

}

