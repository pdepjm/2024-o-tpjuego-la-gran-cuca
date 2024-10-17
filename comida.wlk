import homero.*
import wollok.game.*

class Comida{
    var property nombre
    var property puntos
    var property velocidad
    var property accion

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
        if (nombre == "rosquilla"){
            homero.poneteGrasoso()
        } else if (nombre == "banana"){
            homero.convertiteEnMono()
        } else if (nombre == "plutonio"){
            homero.poneteRadiactivo()
        } else if (nombre == "choripan"){
            homero.cometeUnChoripan()
        } else if (nombre == "mate"){
            homero.tomateUnMate()
        } else if (nombre == "cerveza"){
            homero.tomateUnaCerveza()
        } else if (nombre == "te"){
            homero.tomateUnTe()
        } else if (nombre == "ensalada"){
            homero.comeEnsalada()
        } else if (nombre == "guiso"){
            homero.poneteObeso()
        }
    }

}

// 7
const rosquilla = new Comida(nombre="rosquilla", puntos=5, velocidad=1, accion={homero.poneteGrasoso()})
const banana = new Comida(nombre="banana", puntos=-3, velocidad=-1, accion={homero.convertiteEnMono()})
const plutonio = new Comida(nombre="plutonio", puntos=15, velocidad=1, accion={homero.poneteRadiactivo()})
const choripan = new Comida(nombre="choripan", puntos=100, velocidad=-1, accion={homero.cometeUnChoripan()})
const mate = new Comida(nombre="mate", puntos=20, velocidad=2, accion={homero.tomateUnMate()})
const cerveza = new Comida(nombre="cerveza", puntos=15, velocidad=-2, accion={homero.tomateUnaCerveza()})
const te = new Comida(nombre="te", puntos=-50, velocidad=-1, accion={homero.tomateUnTe()})
const ensalada = new Comida(nombre="ensalada", puntos=-15, velocidad=1, accion={homero.comeEnsalada()})
const guiso = new Comida(nombre="guiso", puntos=15, velocidad=-2, accion={homero.poneteObeso()})



const comidasNivel1 = [rosquilla, banana, plutonio, choripan, cerveza]
const comidasNivel2 = comidasNivel1 + [mate,ensalada,guiso,te]