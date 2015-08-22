#! /usr/bin/env ruby

require_relative 'initialPopulation.rb'
require_relative 'evolvePopulation.rb'
require_relative 'fitness.rb'
require_relative 'readFile.rb'

require 'ruby-prof'
#RubyProf.start


start = Time.now 
# se genera la longitud de la poblacion inicial 
obj = InitialPopulation.new(100, true)

for i in 1..4
   obj = Evolve.evolvePopultaion(obj)
end

cromosome =  Fitness.getBestCromosoma()
puts Fitness.getFitness(cromosome)

sqlStructure = []
(0..(cromosome.size - 1)).each do |j|
   gene = cromosome.getGene(j)
   sqlStructure << gene
end 
# construir el sql que se guarda en la db
connection_database = ReadFiles.new
connection_database.deleteOutSolutions
connection_database.insertOutSolutions(sqlStructure)

finish = Time.now 
puts "se demoro #{finish - start} segundos"

#result = RubyProf.stop
#printer = RubyProf::FlatPrinter.new(result)
#printer.print(STDOUT)
