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


const rosquilla = new Comida(nombre="rosquilla", puntos=10, velocidad=2, accion={homero.poneteGrasoso()})
const banana = new Comida(nombre="banana", puntos=-5, velocidad=-2, accion={homero.convertiteEnMono()})
const plutonio = new Comida(nombre="plutonio", puntos=20, velocidad=-2, accion={homero.poneteRadiactivo()})
const choripan = new Comida(nombre="choripan", puntos=5, velocidad=2, accion={homero.cometeUnChoripan()})
const mate = new Comida(nombre="mate", puntos=100, velocidad=4, accion={homero.tomateUnMate()})
const cerveza = new Comida(nombre="cerveza", puntos=50, velocidad=-4, accion={homero.tomateUnaCerveza()})
const te = new Comida(nombre="te", puntos=-100, velocidad=-2, accion={homero.tomateUnTe()})
const ensalada = new Comida(nombre="ensalada", puntos=-20, velocidad=2, accion={homero.comeEnsalada()})
const guiso = new Comida(nombre="guiso", puntos=80, velocidad=-6, accion={homero.poneteObeso()})