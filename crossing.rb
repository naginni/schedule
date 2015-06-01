# lo que realmente se debe cruzar es el horario del gene
# 1x2x3x4x5x
class Crossing

   def initialize
   end 

   def crossingType(indiv1, indiv2)
      # obtengo la longitud de mi individuo
      length = indiv1.size

      (0..4).each do |x| 
	# guardo toda la informacion de las columnas en un array 
	father = []
	mother = [] 
	(0..(length-1)).each do |y|
	   #obtengo los genes
	    gene1 = indiv1.getGene(y)
	    gene2 = indiv2.getGene(y) 
	    # construyo el padre y la madre con sus esencias
	    father << gene1[x]
	    mother << gene2[x]
	end

	# prubas para el uso del los dos operadores geneticos Cruce uniforma (CU) y Emparejamiento Parcial (PMX)
	children = crossingPMX(father, mother)
        #children = crossingUniform(father, mother)

	# se optienen los decendientes de los padres, hijo uno y hijo dos.
	son1 = children["son_1"]
	son2 = children["son_2"] 

	# este paso se encarga de reemplazar los nuevos genes obtenidos por los genes de los padres.
	(0..(length-1)).each do |y|
	   #obtengo los genes
	    gene1 = indiv1.getGene(y)
	    gene2 = indiv2.getGene(y)
	    #reemplazo los genes por los nuevos hijos 
	    gene1[x] = son1[y]
	    gene2[x] = son2[y]
	    # los agrego al cromosoma 
	    indiv1.setGene(y, gene1)
	    indiv2.setGene(y, gene2)
	end
      end
     newSolution = {"indiv_1" => indiv1, "indiv_2" => indiv2}
     return newSolution
   end

   # realizando cruce uniforme
   def crossingUniform(father, mother)
      # obtengo la longitud de mi individuo
      length = father.length 
      # se instancian los hijos a obtener
      son1 = Array.new(length,0)
      son2 = Array.new(length,0) 
      # se obtienen los puntos de corte
      cortes = getPuntoCorte(length)
      corte_1 = cortes["corte_1"]
      corte_2 = cortes["corte_2"] 
      # se agregan los genes en los puntos de corte establecidos, es decir se realiza el emparejamiento
      (corte_1..corte_2).each do |i|
	 son1[i] = mother[i]
	 son2[i] = father[i]
      end
     # se agregan los genes de los padres que no se encuentran en el hijo
     (0..(length-1)).each do |i|
	# si se encuentra el gene buscado este devuelve un -1 en la busquedad secuencial
	if(i < corte_1 || i > corte_2)
	  son1[i] = father[i]
	  son2[i] = mother[i]
	end 
     end
     # se retornan los decendientes.  
     children = {"son_1" => son1, "son_2" => son2}
     return children
   end 

   # se generan los punto de corte
   def getPuntoCorte(size)
      cortes = {"corte_1" => 0, "corte_2" => 0}

      while true do
	 cortes["corte_1"] = rand(size)
	 cortes["corte_2"] = rand(size)
	 if(cortes["corte_1"] < cortes["corte_2"])
	    break
	 end
      end
      return cortes 
   end 

   # realizando cruce por emparejamiento parcial (PMX)
   def crossingPMX(father, mother)
      # obtengo la longitud de mi individuo
      length = father.length
      # se instancian los hisjos a obtener
      son1 = Array.new(length,0)
      son2 = Array.new(length,0)

      # se obtienen los puntos de corte
      cortes = getPuntoCorte(length)
      corte_1 = cortes["corte_1"]
      corte_2 = cortes["corte_2"]

      # se agregan los genes en los puntos de corte establecidos, es decir se realiza el emparejamiento
      (corte_1..corte_2).each do |i|
	 son1[i] = mother[i]
	 son2[i] = father[i]
      end 
     # se agregan los genes de los padres que no se encuentran en el hijo
     (0..(length-1)).each do |i|
	# si se encuentra el gene buscado este devuelve un -1 en la busquedad secuencial
	if(i < corte_1 || i > corte_2)
	  num = 0
	  num = busquedadSecuencial(father[i], son1)
	  if num < 0
	     son1[i] = father[i]
	  end

	  num = 0
	  num = busquedadSecuencial(mother[i], son2)
	  if num < 0
	     son2[i] = mother[i]
	  end 
	end 
     end
     # los genes que faltan se resuelven mediante los valores emparejados en las subcadenas iniciales
     (corte_1..corte_2).each do |i|
	num = busquedadSecuencial(son1[i],son2)
	if num < 0
	  num = busquedadSecuencial(0, son2)
	  son2[num] = son1[i]
	end

	num = busquedadSecuencial(son2[i],son1)
	if num < 0
	  num = busquedadSecuencial(0, son1)
	  son1[num] = son2[i]
	end 
     end

      children = {"son_1" => son1, "son_2" => son2}
      return children
   end 

   # se realiza la busquedad secuencial
   def busquedadSecuencial(gene, children)
      position = -1
      i = 0
      children.each do |row|
	 # recorremos todo el arreglo
	 if(row == gene)
	    # comparamos el elemento en el arreglo con el buscado
	   # puts "children #{children} gene #{gene}"
	    position = i
	    break
	 end
	 i += 1 
      end
      return position
   end
end
