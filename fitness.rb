require_relative 'readFile'
	# se obtiene el cromosoma y de este se compara cada gen con la informacion del medico si o no cumple con la restriccion.
	# la primera comparacion es si la fecha que contiene el gen coincide con la fecha que se obtiene del medico,
	# si es asi se asigna un 1 si cumple, si no se asigna un 0 si no cumple, el campos fitness donde se ingresa esta info
	# es en el cromosoma para una ves finalizado el proceso se cuenta la cantidad de genes que cumple maximizar la funcion.

class Fitness
	   # se instancia el mejor fitness que sera comparado con el cada nuevo fitness este almacenara el mejor
	   @bestFitness=0
	   # se instancia un atributo que almacenara el mejor cromosoma 
		 @bestCromosoma=0

	   # get medicos info
	   @medicoInfo = ReadFiles.new.readMediActi 

	def initialize
	end 

	# funcion de evaluacion 
	def self.getFitness(individual) 
		#se obtiene la longitud del objeto individual (cromosoma)
		size = (individual.size - 1)
		# inicializo el valor del fitness
		fitness = 0

		(0..size).each do |i|
			gene = individual.getGene(i)
			(i+1..size).each do |j|
				others =individual.getGene(j)
				(0..4).each do |x|
					# si el consultorio del gene es igual al consultorio de los otros genes
					# se evalua que el horario sea diferente
					if(gene[x] == others[x])
						# evaluar los horarios
						fitness += valueSchedule(i,j,x)
					else
						fitness +=  1
					end
				end
			end
		end 

		if getMaxFitness() < fitness
			puts "fitness =  #{getMaxFitness()} \n"
			setMaxFitness(fitness)
			setBestCromosoma(individual)
		end 
		return fitness
	end 

	def self.valueSchedule(i,j,x)

	   schedule_1 = @medicoInfo[i]["fecha"][x]
	   schedule_2 = @medicoInfo[j]["fecha"][x] 

	   fitness = 0
	   if (schedule_1 == "x" && schedule_2 == "x")
	      fitness += 1
	   end
	   if ((schedule_1 == "x" && schedule_2 == "f") || (schedule_1 == "f" && schedule_2 == "x"))
	      fitness += 1
	   end
	   if ((schedule_1 == "m" && schedule_2 == "a") || (schedule_1 == "a" && schedule_2 == "m"))
	      fitness += 1
	   end
	   if ((schedule_1 == "m" && schedule_2 == "x") || (schedule_1 == "x" && schedule_2 == "m"))
	      fitness += 1
	   end
	   if ((schedule_1 == "a" && schedule_2 == "x") || (schedule_1 == "x" && schedule_2 == "a"))
	      fitness += 1
	   end
	   return fitness
	end 

	# se obtiene el mejor fitness
	def self.setMaxFitness(best)
	   @bestFitness = best
	end 

	def self.getMaxFitness
	  return @bestFitness
	end 
	# se guarda el mejor cromosoma para ser visualizado
	def self.setBestCromosoma(indiv)
	   @bestCromosoma = indiv
	end 
	# obtener el mejor cromosoma 
	def self.getBestCromosoma
	 return  @bestCromosoma
	end
end
