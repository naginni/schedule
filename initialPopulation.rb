require_relative 'individuals.rb'

class InitialPopulation 

   def initialize( popuSize, initial)
      @individuals = Array.new(popuSize.to_i) 

      if (initial)
	 (0..(size()-1)).each do |i|
	    newIndiv = Individuals.new()
	    newIndiv.generateIndividual()
	    saveIndividual(i, newIndiv)
	 end
      end 
   end 

   def getFittest
      # get the first cromosoma
      inidividual = @individuals[0]

      @individuals.each do |cromosoma|
	 # get the best individuo whit the best fitness
	 indiv_1 = inidividual.getFitness()
	 indiv_2 = cromosoma.getFitness() 
	 
	 if ( indiv_1 <= indiv_2 )
	    inidividual = cromosoma
	 end
      end
      return inidividual
   end

   # get each individual 
   def getIndividual(index)
      return @individuals[index]
   end

   # save each individuals on the array
   def saveIndividual(index, indiv)
      @individuals[index] = indiv
   end

   # get the length of the array individuals
   def size
      @individuals.length
   end

end
