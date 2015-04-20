#! /usr/bin/env ruby

require_relative 'initialPopulation.rb'
require_relative 'evolvePopulation.rb'
require_relative 'fitness.rb'

require 'ruby-prof'
RubyProf.start


#start = Time.now 
# se genera la longitud de la poblacion inicial 
obj = InitialPopulation.new(100, true)

evolve = Evolve.new
for i in 1..2
   obj = evolve.evolvePopultaion(obj)
end
cromosome =  Fitness.getBestCromosoma()
#(0..(cromosome.size - 1)).each do |j|
#   gene = cromosome.getGene(j)
#   gene.each do |value|
#      print " #{value} | "
#   end
#   puts
#end 

#finish = Time.now 
#puts "se demoro #{finish - start} segundos"

result = RubyProf.stop
printer = RubyProf::FlatPrinter.new(result)
printer.print(STDOUT)
