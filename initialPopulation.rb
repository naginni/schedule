require_relative 'individuals.rb'

class InitialPopulation 

   def initialize( popuSize, initial)
      @individuals = Array.new(popuSize.to_i) 
      # se crea la poblacion inicial
      if (initial)
	 (0..(size()-1)).each do |i|
	    newIndiv = Individuals.new()
	    newIndiv.generateIndividual()
	    saveIndividual(i, newIndiv)
	 end
      end 
   end 

   def getFittest
      # obtengo el primer cromosoma
      inidividual = @individuals[0]

      @individuals.each do |cromosoma|
	 # obtengo el mejor idividuo dependiento del mejor fitness
	 indiv_1 = inidividual.getFitness()
	 indiv_2 = cromosoma.getFitness() 
	 # si el individuo anterior es peor que el actual entonces lo reemplazo 
	 if ( indiv_1 <= indiv_2 )
	    inidividual = cromosoma
	 end
      end
      return inidividual
   end

   # obtengo cada individuo 
   def getIndividual(index)
      return @individuals[index]
   end 
   # se guarda cada individuo en el array
   def saveIndividual(index, indiv)
      @individuals[index] = indiv
   end 
   # optengo la longitud del arreglo de los individuos.
   def size
      @individuals.length
   end

end
