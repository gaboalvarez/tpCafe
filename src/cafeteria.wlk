object cafeteria{
	var cafesListos = []
	var nada = []
	var pedidos = []
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
			cafesListos.add(pedidos.first())
			pedidos.remove(pedidos.first())
		}
	}
	method nose(x){
		nada.add(x)
	}
	method mostrarNada(){
		return nada
	}
	method cuantaGenteHay(){
		return clientesEsperando
	}
	method molerGranos(){
		maquina.moler(10)
	}
	method atenderCliente(cafe){
		clientesEsperando += 1 
		plata += 10
		pedidos.add(cafe)
	}
	method mostrarPedidos(){
		return pedidos
	}
	method entregarPedidos(){
		// critico.clasificar(cafesListos.first())
		cafesListos.remove(cafesListos.first())
		clientesEsperando -= 1
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
class Cafe{
	var porc_cafe
	var porc_leche
	method porc(x,y){
		porc_cafe = x
		porc_leche = y
	}
	method p_c(){
		return porc_cafe
	}
	method p_l(){
		return porc_leche
	}
}
object critico{
	method clasificar(cafe){
		
	}
}