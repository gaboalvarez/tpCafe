object cafeteria{
	var cafesListos = []
	var clientesEsperando = 0
	var plata = 100
	var granosCafe = 100
	var granosCafeMolidos = 0
	var leche = 100
	method granosCafe(){
		return granosCafe
	}
	method granosCafeMolidos(){
		return granosCafeMolidos
	}
	method leche(){
		return leche
	}
	method modificarGranosMolidos(cantActualizada){
		granosCafeMolidos = cantActualizada
	}
	method modificarGranosCafe(cantActualizada){
		granosCafe = cantActualizada
	}
	method modificarLeche(cantActualizada){
		leche = cantActualizada
	}
	method comprarIngredientes(){
		plata -=20
		granosCafe += 10
		leche +=10
	}
	method puedeHacerCafe(){
		return ((granosCafeMolidos >=5) and(leche>=5))
	}
	method hacerCafe(){
		if(!(self.puedeHacerCafe())){
			throw new Exception(message="No se puede hacer el cafe")
		}
		if(self.puedeHacerCafe()){
			if(plata>=50){
				maquina.hacerCafe(10)
			}else{
				maquina.hacerCafe(5)
			}
		}
	}
	method molerGranos(){
		maquina.moler(10)
	}
}

object maquina{
	var granosCafe
	var leche
	var granosCafeMolidos
	const limite = 80
	method moler(cant_a_moler){
		granosCafe = cafeteria.granosCafe()
		granosCafeMolidos = cafeteria.granosCafeMolidos()
		if((granosCafeMolidos +1) > limite){
			throw new Exception(message="no se puede moler mas granos")
		}
		if(granosCafeMolidos <= limite){
			cafeteria.modificarGranosCafe(granosCafe - cant_a_moler)
			cafeteria.modificarGranosMolidos(granosCafeMolidos + cant_a_moler)	
		}
	}
	method hacerCafe(cant_a_usar){
		granosCafeMolidos = cafeteria.granosCafeMolidos()
		leche = cafeteria.leche()
		cafeteria.modificarGranosMolidos(granosCafeMolidos - cant_a_usar)
		cafeteria.modificarLeche(leche - cant_a_usar)
	}
}