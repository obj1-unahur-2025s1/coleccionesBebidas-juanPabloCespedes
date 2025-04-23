object tito {
    var cantidad = 0
    var bebida = cianuro
    method peso() = 70
    method inerciaBase() = 490
    method consumir(unaCantidad,unaBebida) {
        bebida = unaBebida
        cantidad = unaCantidad
    }
    method bebida() = bebida

    method velocidad() {
        return bebida.rendimiento(cantidad)
        * self.inerciaBase() / self.peso()
    }
}

object wisky {
    method rendimiento(cantidad) = 0.9 ** cantidad
}
object cianuro {
    method rendimiento(cantidad) = 0
}

object terere {
    method rendimiento(cantidad) {
        return 1.max(cantidad * 0.1)
        //tambien (cantidad * 0.1).max(1)
    }
}

object licuadoDeFrutas {
    var listaDeFrutas = [manzana,mandarina,banana]
    method rendimiento(cantidad){
        if(cantidad == 1000){
            return listaDeFrutas.sum({e=>e.nutrientes()})
        }
    }
}
object aguaSaborizada {
    var otraBebida = wisky

    method rendimiento(cantidad){
        var cantidadDeBebida = cantidad * 0.25
        return 1 + otraBebida.rendimiento(cantidadDeBebida)
    } 
}
object coctel {
    var listaDebebidas = [wisky]

    method rendimiento(cantidad){
       return listaDebebidas.fold(1,{acc, e=> acc *e.rendimiento(cantidad)})
    } 
}
object coctelSuave{
    var listaDebebidas = [terere]
    
    method rendimiento(cantidad){
       var suma = 0
        
       listaDebebidas.forEach({e=>
        if (e.rendimiento(cantidad)>0.5){
            suma = suma + e.rendimiento(cantidad)
        }
       })
       return suma 
    } 
}



object manzana {
  method nutrientes() = 10
}
object mandarina {
  method nutrientes() = 10
}
object banana {
  method nutrientes() = 10
}
