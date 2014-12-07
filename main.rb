#! /usr/bin/env ruby

require_relative 'initialPopulation.rb'
require_relative 'evolvePopulation.rb'
require_relative 'fitness.rb'

# se genera la longitud de la poblacion inicial 
obj = InitialPopulation.new(100, true)

evolve = Evolve.new
for i in 1..10
   obj = evolve.evolvePopultaion(obj)
end
cromosome =  Fitness.getBestCromosoma()
(0..(cromosome.size - 1)).each do |j|
   gene = cromosome.getGene(j)
   gene.each do |value|
      print " #{value} | "
   end
   puts
end




# realizar el cruce uniforme y si se encuentra un consultorio en el mismo horario mutar este por uno que no se encuentre
