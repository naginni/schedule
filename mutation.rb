class Mutation

   def initialize
     @length = ReadFiles.new.readConsultorios.length
   end 

   # si la cantidad de consultorios es igual o superior a los medicos entonces se verifica que en cada 
   # columna no se encuentren consultorios repetidos. 
   # Si la cantidad de consultorios es menor a los medicos no se realiza la mutacion y se establece una aproximacion del cromosoma,
   # porque no hay solucion
   def doMutation(cromosome)
      if @length >= cromosome.size
	#se obtiene la longitud del objeto individual (cromosoma)
	size = (cromosome.size - 1)

	 (0..4).each do |x|

	   # guardo toda la info de las colum en un array 
           array = [] 
	   (0..size).each do |y|
	       gene = cromosome.getGene(y)
	       array << gene[x] 
	   end
	   # consulto que valores no estan y los agrego
	   noin =  busquedadSecuencial(array)

	   # comparo que consultorio son iguales y le agrego los que no tiene en la columna 
	   (0..size).each do |i| 
	      # obtengo el gene que se va a mutar
	      gene = cromosome.getGene(i)
	      (i+1..size).each do |j|
		 # obtengo el siguiente gene para comparar
		 others = cromosome.getGene(j)
		 # comparo los consultorio de cada gene si esta repetido muto el segundo
		 if(gene[x] == others[x])
		    # agrego el consultorio que no esta
		    others[x] = noin.pop
		    # agrego la info al gene
		    cromosome.setGene(j, others)
		 end
	      end
	    end
	 end 
      end 
   end

   # stains;gate

   # se realiza la busquedad secuencial
   def busquedadSecuencial(array)
      consult = ReadFiles.new.readConsultorios.keys 
      i = 0
      consult.each do |x|
	 array.each do |value|
	    # recorremos todo el arreglo
	    if(value == x)
	       # comparamos el elemento en el arreglo con el buscado
	       consult.delete_at(i)
	       break
	    end
	 end
	 i += 1 
      end
      return consult
   end
end
