require_relative 'initialPopulation.rb'
require_relative 'selection.rb'
require_relative 'crossing.rb'

class Evolve
   def initialize
      # se instancia el obj de la clase selection para llamar el metodo de seleccion por torneo 
      @selection = Selection.new
      # se instancia el obj de la clse cruse para llamar el metodo de cruze PMX
      @crossing = Crossing.new
   end

   def evolvePopultaion(population)
      size = population.size
      # instancio una nueva poblacion
      newPopulation = InitialPopulation.new(size, false)
      # loop over population size and create new individual with crossover 
      (0..(size-1)).step(2) do |i|
	 indiv1 = @selection.tournameSelection(population)
	 indiv2 = @selection.tournameSelection(population)
	 # se realiza el cruce de los individuos (indiv1, indiv2)
#	 newIndiv = @crossing.crossingPMX(indiv1, indiv2)
	 # se guardan los nuevos individuos generados por el cruce
	 newPopulation.saveIndividual(i, newIndiv["indiv_1"])
	 newPopulation.saveIndividual(i+1, newIndiv["indiv_2"]) 
      end
      # mutate population (mutacion por intercambio)

      return newPopulation
   end
end
