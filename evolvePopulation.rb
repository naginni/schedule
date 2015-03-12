require_relative 'initialPopulation.rb'
require_relative 'selection.rb'
require_relative 'crossing.rb'
require_relative 'mutation.rb'

class Evolve
   def initialize
      # se instancia el obj de la clase selection para llamar el metodo de seleccion por torneo 
      @selection = Selection.new
      # se instancia el obj de la clse cruse para llamar el metodo de cruze PMX
      @crossing = Crossing.new
      # se instancia el obj de la clase mutation para realizar la mutacion de los genes
      @mutation = Mutation.new
   end

   def evolvePopultaion(population)
      size = population.size
      # instancio una nueva poblacion
      newPopulation = InitialPopulation.new(size, false)
      # loop over population size and create new individual with crossover 
      i=0
      while i < (size-1) do
	 indiv1 = @selection.tournameSelection(population)
	 indiv2 = @selection.tournameSelection(population)
	 # se realiza el cruce de los individuos (indiv1, indiv2)
	 newIndiv = @crossing.crossingType(indiv1, indiv2)
	 # se guardan los nuevos individuos generados por el cruce
	 newPopulation.saveIndividual(i, indiv1)
	 newPopulation.saveIndividual(i+1, indiv2) 
	 i+=2
      end
      # mutate population (mutacion por intercambio) 
      (0..(size-1)).each do |j|
	 @mutation.doMutation(newPopulation.getIndividual(j))
      end 
      return newPopulation
   end
end
