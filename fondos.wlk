class Fondo {
    const position = new MutablePosition(x=0, y=0)
    var property nombreFondo
    

    method position() = position

    method image() = nombreFondo + ".png"

}

const obelisco = new Fondo(nombreFondo="obelisco2")