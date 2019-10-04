object cafeteria{
	var cafesListos = []
	var clientesEsperando = 0
	var plata = 100
	var granosCafe = 100
	var leche = 100
	
	method clientesEsperando(){
		return clientesEsperando
	}
	
	method cafesListos(){
		return (cafesListos.size())
	}
	
	method esRico(){
		return plata>50
	}
	
	method atenderCliente(){
		clientesEsperando +=1
		plata +=5
	}
	
	method darPedido(){
		if(clientesEsperando>0){
			if(cafesListos.size() > 0){
				clientesEsperando -=1
				cafesListos.remove(cafesListos.first())
			}else{
				throw new Exception(message="no hay suficientes cafes listos")
			}
		}else{
			throw new Exception(message="no hay clientes en espera")
		}
	}
	
	method comprarIngredientes(){
		if(plata >=20){
			granosCafe +=10
			leche +=10
			plata -=20
		}else{
			throw new Exception(message="no hay suficiente plata")
		}
	}
	
	method hacerCafe(){
		if(plata<5){
			throw new Exception(message="no hay suficiente plata")
		}
		if(self.esRico()){
			maquina.hacerCafe(10)
			granosCafe -=10
			leche -=10
		}else{
			maquina.hacerCafePeor(granosCafe,leche)
		}
		cafesListos.add(maquina)
	}
}
// arreglar los throws, menos ifs

object maquina{
	
}