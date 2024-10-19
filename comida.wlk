import homero.*
import wollok.game.*

// TODO: La velocidad no debe ser la de homero, sino el coeficiente general de tick de caída
// TODO: Deben existir cosas que no conviene agarrar (silla de plástico) porque pierden de una
// TODO: Cuando agarra la cerveza se invierten los movimientos -> NO VALE USAR IF EN NINGUN LADO
// POLEMORFESMOOOOOOOOO

class Comida{
    var property nombre
    var property puntos
    var property velocidad
    const tipoAvance = aLaDerecha

    const position = new MutablePosition(x=(0..8).anyOne()*2, y=16)
    
    method image() = nombre + ".png"
    method position() = position

    method bajar(){
        if (position.y() >= -2){
            position.goDown(2)
        }else{
            game.removeVisual(self)
            position.goUp(18)
            position.goLeft((0..8).anyOne()*2)
            position.goRight((0..8).anyOne()*2)
            position.x().max(0)
            position.x().min(16)
            game.addVisual(self)
        } 
    }

    method interactua(homero){
        homero.come(self)
    }

    method moverseAdelante(posicion){
        tipoAvance.moverseAdelante(posicion)
    }

}


object aLaDerecha{
    method moverseAdelante(posicion){
        if(posicion.x() <= game.width() - 2 && posicion.x() + 1 <= game.width())
             posicion.goRight(1)
    }
}


const rosquilla = new Comida(nombre="rosquilla", puntos=5, velocidad=1)
const banana = new Comida(nombre="banana", puntos=-3, velocidad=-1)
const plutonio = new Comida(nombre="plutonio", puntos=15, velocidad=1)
const cerveza = new Comida(nombre="cerveza", puntos=15, velocidad=-2)
const choripan = new Comida(nombre="choripan", puntos=7, velocidad=-1)
const mate = new Comida(nombre="mate", puntos=20, velocidad=2)
const te = new Comida(nombre="te", puntos=-50, velocidad=-1)
const ensalada = new Comida(nombre="ensalada", puntos=-15, velocidad=1)
const guiso = new Comida(nombre="guiso", puntos=15, velocidad=-2)

const comidasNivel1 = [rosquilla, banana, plutonio, choripan, cerveza]
const comidasNivel2 = comidasNivel1 + [mate,ensalada,guiso,te]

object grasiento {
    method imagen() = "rosquilla"
}