#! /usr/bin/env ruby
require 'enumerator'

require_relative 'initialPopulation.rb'
require_relative 'evolvePopulation.rb'
require_relative 'readFile'

# se genera la longitud de la poblacion inicial 
obj = InitialPopulation.new(100, true)

evolve = Evolve.new
obj = evolve.evolvePopultaion(obj)

# realizar el cruce uniforme y si se encuentra un consultorio en el mismo horario mutar este por uno que no se encuentre
