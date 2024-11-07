import homero.*
import wollok.game.*
import tableros.*
import niveles.*

class Comida{
    var property nombre
    var property puntos
    var property velocidad
    var property velocidadCaida 
    const tipoAvance = aLaDerecha
    const fulminante = noPierde

    method velocidadCaida() = velocidadCaida

    method velocidadCaida(nuevaVelocidad){
        velocidadCaida = nuevaVelocidad
    }

    var position = new MutablePosition(x=(0..game.width()).anyOne()*2, y=game.height())
    
    method image() = nombre + ".png"
    method position() = position

    method positionX(nueva_pos_x){
        position = new MutablePosition(x=nueva_pos_x, y=game.height())
    }

    method bajar(){
        if (position.y() >= -2){
            position.goDown(1)
        }else{
            game.removeVisual(self)
            position.goUp(game.height())
            self.positionX((0..(game.width()-2)).anyOne())
            game.addVisual(self)
        } 
    }

    method interactua(homero){
        fulminante.pierdeONo()
        homero.come(self)
        game.removeVisual(self)
    }

    method moverseAdelante(posicion){
        tipoAvance.moverseAdelante(posicion)
    }

    method moverseAtras(posicion){
        tipoAvance.moverseAtras(posicion)
    }

}


object aLaDerecha{
    method moverseAdelante(posicion){
        if(posicion.x() <= game.width() - 3 && posicion.x() + 1 <= game.width() - 2)
             posicion.goRight(1)
    }

    method moverseAtras(posicion){
        if(posicion.x() >= 1 && posicion.x() - 1 >= 0)
            posicion.goLeft(1)
    }

}

object aLaIzquierda{
    method moverseAtras(posicion){
        if(posicion.x() <= game.width() - 3)
            posicion.goRight(1)
    }

    method moverseAdelante(posicion){
        if(posicion.x() >= 1)
            posicion.goLeft(1)
    }
}

object pierde{
    method pierdeONo(){
        tiempo.timer(0)
    }
}

object noPierde{
    method pierdeONo(){

    }
}
const rosquilla = new Comida(nombre="rosquilla", puntos=5, velocidad=0, velocidadCaida=1500)
const banana = new Comida(nombre="banana", puntos=-3, velocidad=1.2, velocidadCaida=1400)
const plutonio = new Comida(nombre="plutonio", puntos=15, velocidad=0.25, velocidadCaida=1300)
const cerveza = new Comida(nombre="cerveza", puntos=15, velocidad=0.25, velocidadCaida=1200, tipoAvance=aLaIzquierda)
const choripan = new Comida(nombre="choripan", puntos=7, velocidad=0.5, velocidadCaida=1100)
const mate = new Comida(nombre="mate", puntos=20, velocidad=0.1, velocidadCaida=1000)
const te = new Comida(nombre="te", puntos=-50, velocidad=2, velocidadCaida=900)
const ensalada = new Comida(nombre="ensalada", puntos=-15, velocidad=1.75, velocidadCaida=800)
const guiso = new Comida(nombre="guiso", puntos=15, velocidad=0.75, velocidadCaida=700)
const silla = new Comida(nombre="silla", puntos=-100, velocidad=1, velocidadCaida=600, fulminante=pierde)

const comidasNivel1 = [rosquilla, banana, plutonio, choripan, cerveza,silla]
const comidasNivel2 = comidasNivel1 + [mate,ensalada,guiso,te]
