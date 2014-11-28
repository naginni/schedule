require_relative 'individuals.rb'

class InitialPopulation

   def initialize( popuSize, initial)
      @individuals = Array.new(popuSize.to_i) 

      if initial
	 (0..size()).each do |i|
	    newIndiv = Individuals.new()
	    newIndiv.generateIndividual()
	    saveIndividual(i, newIndiv)
	 end
      end 
      #fittest = @individuals[1]
      #fittest.getFitness()
      #puts @individuals[0].getGene(4)
   end 

   def getFittest
      # get the first cromosoma
      inidividual = @individuals[0]

      @individuals.each do |cromosoma|
	 # get the best individuo whit the best fitness
	 indiv_1 = inidividual.getFitness()
	 indiv_2 = cromosoma.getFitness()
	 
	 puts "fitness one #{indiv_1}"
	 puts "fitness two #{indiv_2}"

	 if ( indiv_1 <= indiv_2 )
	    inidividual = cromosoma
	 end
      end
      # retornar el mejor individuo
      puts inidividual.getGene(0)
      puts inidividual.getGene(1)
      puts inidividual.getGene(2)
      puts inidividual.getGene(3)
      puts inidividual.getGene(4)
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
