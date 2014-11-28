require_relative 'readFile.rb'
require_relative 'fitness.rb'

class Individuals
  
   # read and write my value
   attr_accessor :defaultLength

   #instanciando las variables correspondientes
   def initialize
      @fitness = 0
      # instancion el cromosoma optenido desde el archivo csv
      object = ReadFiles.new()
      @file_mediActi = object.readMediActi
      # se optinenen los keys de los consultorios para agregarlos de forma aleatoria al cromosoma
      @file_consult = object.readConsultorios.keys

      @length = @file_mediActi.length
      @cromosoma  = Array.new(@length)
   end

   # generar el cromosoma (individuos) estos son leidon desde el archivo csv
   def generateIndividual
      # se intancian los dias de la semana estos tomaran valores de 1 a 5 (mon, tue, wed, thu, fri)
      # cada dia sera concatenado con un horario de trabajo que toman los valores de 0 a 2 (f, m, a)
      # estos seran concatenados y se ingresaran en el gene fecha para permitir un rapido asceso a la info 
     (0..(@length-1)).each do |i|
	 # se agregan los consultorios 
	 consultorios = Array.new
	 consultorios[0] = @file_consult[rand(@file_consult.length)]
	 consultorios[1] = @file_consult[rand(@file_consult.length)]
	 consultorios[2] = @file_consult[rand(@file_consult.length)]
	 consultorios[3] = @file_consult[rand(@file_consult.length)]
	 consultorios[4] = @file_consult[rand(@file_consult.length)]

	 @cromosoma[i] = consultorios
      end 
      return @cromosoma
   end 

   def getFitness
	 fit = Fitness.new
	 @fitness = fit.getFitness(self)
   end

   def getGene(index)
      @cromosoma[index]
   end

   def setGene(index, valu)
      @cromosoma[index] = value
   end

   # get the genes length
   def size
      @cromosoma.length
   end
end
