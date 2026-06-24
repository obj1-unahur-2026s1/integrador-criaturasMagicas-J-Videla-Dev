class Criatura {
    var poderMagico
    const astucia
    var rolEnElParque

    
    method poderMagico() = poderMagico
    method esFormidable() = self.esAstuta() || self.esExtraordinaria()

    method esAstuta()
    method esExtraordinaria() = rolEnElParque.esExtraordinario(self)
    method rolEnElParque() = rolEnElParque

    method poderOfensivo() = poderMagico * 10 + rolEnElParque.extra()

    method ritualCambioDeRol() {
        rolEnElParque = rolEnElParque.siguienteRol()
    }   
    method perder15Porciento(){
        poderMagico = poderMagico * 0.85
    }
    


}
class Hada inherits Criatura {
    var kmQuePuedeVolar = 2
    

    override method esAstuta() = astucia > 50
    override method esExtraordinaria() = super() && kmQuePuedeVolar > 10
    method kmQuePuedeVolar() = kmQuePuedeVolar
    method aumentarKmQuePuedeVolar(unValor) { 
        kmQuePuedeVolar = (kmQuePuedeVolar + unValor).min(25) }
}
class Duende inherits Criatura {
    override method esAstuta() = false
    override method poderOfensivo() = super() * 1.10
}

object guardian {   
    method esExtraordinario(unaCriatura) = unaCriatura.poderMagico() > 50  
    method extra() = 100
    method siguienteRol() = new Domador(
        criaturasDomadas = #{ new CriaturaMitologica(edad=1, tieneCuernos=false) }
    )
}
class Domador {
    const criaturasDomadas = #{}


    method esExtraordinario(unaCriatura) = unaCriatura.poderMagico() >= 15 && self.todasLasCriaturasDomadasSonVeteranas()
    method extra() = criaturasDomadas.count({c => c.tieneCuernos()}) * 150 

    method domarCriatura(unaMascota) {
        criaturasDomadas.add(unaMascota)
    }
    method todasLasCriaturasDomadasSonVeteranas() = criaturasDomadas.all({c => c.esVeterana()})
    method unaCriaturaEsVeterana() = criaturasDomadas.any({c => c.esVeterana()})
    method algunaMascotaTieneCuernos() = criaturasDomadas.any({c => c.tieneCuernos()})
    method puedeCambiarASiguienteRol() = self.algunaMascotaTieneCuernos()
    method siguienteRol() {
        if (not self.algunaMascotaTieneCuernos()) {
            self.error("El domador no tiene mascotas con cuernos, falla el ritual.")
        }
        return hechicero
        }
}
object hechicero {
    method extra() = 0
    method esExtraordinario(unaCriatura) = true
    method siguienteRol() = guardian
}
class CriaturaMitologica {

    const edad
    const tieneCuernos 

    method tieneCuernos() = tieneCuernos
    method esVeterana() = edad >= 10

}

