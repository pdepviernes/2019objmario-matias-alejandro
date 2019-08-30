import wollok.game.*

object juego {

	method iniciar() {
		game.title("Mario el ahorrista")
		game.width(7)
		game.height(7)
		game.addVisual(peso)
		game.addVisual(unDolar)
		game.addVisual(flor)
		game.addVisual(balanza)
		game.addVisual(fantasmita)
		game.addVisual(mario)
		game.addVisual(luigi)
		game.start()
	}

}

object mario {
	var position = game.center()
	var pesosAhorrados = 0
	var inversion = plazoFijo
	var multi = 1

	var dias = 1

	method nombre() {
		return 'mario'
	}

	method dias() {
		return dias
	}

	method levantar(cosa) {
		position = cosa.position()
		pesosAhorrados = pesosAhorrados + cosa.valor()
		game.say(self, "Junte " + cosa.valor().toString())
		if (cosa.nombre()=="flor"){
			game.say(self, "Soy un mago de las finanzas ")
			multi = flor.tamano()
		}
	}

	method valorFinanciero() {
		return inversion.rendimiento(self) * multi + pesosAhorrados
	}

	method mostrarAhorros() {
		game.say(self, "Junte " + pesosAhorrados + " pesos.")
	}

	method pesosAhorrados() = pesosAhorrados

	method image() {
		return "mario.png"
	}

	method position() {
		return position
	}
}

object peso {
	var valor = 5
		
	method nombre() {
		return "peso"
	}
	
	method valor() {
		return valor
	}

	method position() {
		return game.center().right(2)
	}

	method image() {
		return "peso.png"
	}
}

object unDolar {

	method nombre() {
		return "dolar"
	}
	method valor() = banco.cotizacion()

	method position() {
		return game.center().left(2)
	}

	method image() {
		return "dolar.png"
	}

}

object banco {

	var cotizacion = 45

	method pesos() = 1000 * cotizacion

	method cotizacion() {
		return cotizacion
	}

	method corrida() {
		cotizacion = 57
		balanza.desbalancear()
	}

	method tranquilidad() {
		cotizacion = 45
		balanza.balancear()
	}

}

object flor {
	
	var tamano = 3
	
	method tamano(){
		return tamano
	}
	
	method nombre() {
		return "flor"
	}

	method valor() {
		return 0
	}

	method position() {
		return game.center().up(2)
	}

	method image() {
		return "flor.png"
	}

}

object balanza {

	const imagenBalanceada = "balanceado.png"
	var imagen = imagenBalanceada

	method balancear() {
		imagen = imagenBalanceada
	}

	method desbalancear() {
		imagen = "desbalanceado.png"
	}

	method position() {
		return game.center().down(2)
	}

	method image() {
		return imagen
	}

}


object plazoFijo {
	method rendimiento(alguien) {
		if (alguien.nombre() == 'luigi')
		{
			return (alguien.dias() * 0.02 * alguien.pesosAhorrados())/2
		}
		else
		{
			return alguien.dias() * 0.02 * alguien.pesosAhorrados()	
		}
	}

}

object lebacs {

	method rendimiento(alguien) {
		if (alguien.nombre() == 'luigi')
		{
			return (0.1 * self.promedio(alguien))/2
		}
		else
		{
			return 0.1 * self.promedio(alguien)	
		}
	}

	method promedio(alguien) {
		return (banco.pesos() + alguien.pesosAhorrados()) / 2
	}

}

object luigi {
	var position = game.center().down(2).left(2)
	var pesosAhorrados = 0
	var inversion = plazoFijo
	var multi = 1

	var dias = 1

	method dias() {
		return dias
	}

	method nombre() {
		return 'luigi'
	}

	method levantar(cosa) {
		position = cosa.position()
		pesosAhorrados = pesosAhorrados + cosa.valor()
		game.say(self, "Junte " + cosa.valor().toString())
	}

	method valorFinanciero() {
		return inversion.rendimiento(self) * multi + pesosAhorrados
	}

	method mostrarAhorros() {
		game.say(self, "Junte " + pesosAhorrados + " pesos.")
	}

	method pesosAhorrados() = pesosAhorrados

	method image() {
		return "luigi.png"
	}

	method position() {
		return position
	}
}

object fantasmita {
	var valor = 512
	
	method nombre() {
		return "fantasmita"
	}
	
	method valor() {
		return valor
	}
	
	method position() {
		return game.center().up(2).right(2)
	}

	method image() {
		return "fantasmita.png"
	}
}

