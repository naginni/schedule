# lo que realmente se debe cruzar es el horario del gene
# 1x2x3x4x5x
class Crossing

   def initialize
   end 

   # realizando cruce por emparejamiento parcial (PMX)
   def crossingPMX(indiv1, indiv2)
      # obtengo la longitud de mi individuo
      length = indiv1.size
      # se instancian los hisjos a obtener
      son1 = Array.new(length,0)
      son2 = Array.new(length,0)

      # se obtienen los puntos de corte
      cortes = getPuntoCorte(length)
      corte_1 = cortes["corte_1"]
      corte_2 = cortes["corte_2"]

      # se agregan los genes en los puntos de corte establecidos, es decir se realiza el emparejamiento
      (corte_1..corte_2).each do |i|
	 son1[i] = indiv2.getGene(i)
	 son2[i] = indiv1.getGene(i)
      end
      
     # se agregan los genes de los padres que no se encuentran en el hijo
     (0..(length-1)).each do |i|
	# si se encuentra el gene buscado este devuelve un -1 en la busquedad secuencial
	if(i < corte_1 || i > corte_2)
	  num = 0
	  num = busquedadSecuencial(indiv1.getGene(i), son1)
	  if num < 0
	     son1[i] = indiv1.getGene(i)
	  end

	  num = 0
	  num = busquedadSecuencial(indiv2.getGene(i), son2)
	  if num < 0
	     son2[i] = indiv2.getGene(i)
	  end 
	end 
     end
     # los genes que faltan se resuelven mediante los valores emparejados en las subcadenas iniciales
     (corte_1..corte_2).each do |i|
	num = busquedadSecuencia(son1[i],son2)
	if num < 0
	  num = busquedadSecuencia(0, son2)
	  son2[num] = son1[i]
	end

	num = busquedadSecuencia(son2[i],son1)
	if num < 0
	  num = busquedadSecuencia(0, son1)
	  son1[num] = son2[i]
	end 
     end

     # agregar los nuevos cromosomas a la poblacion
     (0..(length-1)).each do |i|
	indiv1.setGene(i, son1[i])
	indiv2.setGene(i, son2[i]) 
     end 
      newSolution = {"indiv_1" => indiv1, "indiv_2" => indiv2}
      return newSolution
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

   # se realiza la busquedad secuencial
   def busquedadSecuencial(gene, children)
      position = -1
      i = 0
      children.each do |row|
      puts "children #{row} gene #{gene}"
	 # recorremos todo el arreglo
	 if(row["id"] == gene["id"])
	    # comparamos el elemento en el arreglo con el buscado
	    position = i
	    break
	 end
	 i += 1 
      end
      return position
   end
end
