import Criaturas.*
class Colonia {

    var criaturas = []


    method conquistarUnArea(unArea) {
        if(self.poderOfensivo() > unArea.poderDefensivo()){
            unArea.serUsurpada(self)
        }
        else criaturas.forEach({c => c.perder15Porciento()})
    }
        
        
    method poderOfensivo() = criaturas.sum({c => c.poderOfensivo()})
    method cantidadDeCriaturasFormidables() = criaturas.count({c => c.esFormidable()})
}

class Area {

    var colonia = new Colonia()

    method poderDefensivo()
    method serUsurpada(unaColonia) {
        colonia = unaColonia
    }

}
class Castillo inherits Area {

    override method poderDefensivo() = colonia.cantidadDeCriaturasFormidables() * 200


}
class Claro inherits Area {

override method poderDefensivo() = colonia.poderOfensivo() + 100

}