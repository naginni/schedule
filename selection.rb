require_relative 'initialPopulation.rb'

class Selection 
   # metodo de seleccion de los cromosomas por torneo
   def self.tournameSelection(population)
		  # cantidad de individuos seleccionados para el torneo
			tournamentSize = 3
      # se crea un torneo para la poblacion
      tournament =  InitialPopulation.new(tournamentSize, false)
      # para cada lugar en el torneo se obtiene un individuo de forma aleatoria 
      (0..(tournamentSize-1)).each do |i| 
         randomId = rand(population.size)
				 tournament.saveIndividual(i, population.getIndividual(randomId))
      end 
      # se obtiene el mejor cromosoma de la seleccion por torneo, este se prepara para ser cruzado
      cromosoma = tournament.getFittest
      # retorno el mejor cromosoma
      return cromosoma
   end
end
