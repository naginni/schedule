require_relative 'initialPopulation.rb'

class Selection

   def initialize 
      @tournamentSize = 3
   end

   # metodo de seleccion de los cromosomas por torneo
   def tournameSelection(population)
      # create a tournament population
      tournament =  InitialPopulation.new(@tournamentSize, false)
      # for each place in the tournament get a random individual 
      (0..(@tournamentSize-1)).each do |i| 
         randomId = rand(population.size)
	 tournament.saveIndividual(i, population.getIndividual(randomId))
      end 
      # obtengo el mejor cromosoma de mi seleccion por torneo, este lo preparo para ser cruzado
      cromosoma = tournament.getFittest
      # retorno el mejor cromosoma
      return cromosoma
   end
end
