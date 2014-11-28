require_relative 'readFile'
	# se obtiene el cromosoma y de este se compara cada gen con la informacion del medico si o no cumple con la restriccion.
	# la primera comparacion es si la fecha que contiene el gen coincide con la fecha que se obtiene del medico,
	# si es asi se asigna un 1 si cumple, si no se asigna un 0 si no cumple, el campos fitness donde se ingresa esta info
	# es en el cromosoma para una ves finalizado el proceso se cuenta la cantidad de genes que cumple maximizar la funcion.

class Fitness

	def initialize
	   # get medicos info
	   objFile = ReadFiles.new
	   @medicoInfo = objFile.readMedicos 
	end 

	# funcion de evaluacion 
	def getFitness(individual) 
	   #se obtiene la longitud del objeto individual (cromosoma)
	   size = (individual.size - 1)
	   puts size
	   # inicializo el valor del fitness
	   fitness = [0]

	   (0..size).each do |i|
	      gene = individual.getGene(i)
	      (i+1..size).each do |j|
		 others =individual.getGene(j)
		 (0..4).each do |x|
		    # si el consultorio del gene es igual al consultorio de los otros genes
		    # se evalua que el horario sea diferente
		    if(gene[x] == others[x])
		       puts "#{j}  gene1 #{gene[x]} == gene2 #{others[x]}"
		       # evaluar los horarios
		      fitness[0] = fitness[0] + valueSchedule(i,j,x)
		    else
		       fitness[0] = fitness[0] + 0.1
		    end
		 end
	      end
	   end 
	   return fitness[0]
	end 

	def valueSchedule(i,j,x)

	   schedule_1 = @medicoInfo[i]["fecha"][x]
	   schedule_2 = @medicoInfo[j]["fecha"][x] 

	   fitness = 0
	   if (schedule_1 == "x" && schedule_2 == "x")
	      fitness = fitness + 0.1
	   end
	   if ((schedule_1 == "x" && schedule_2 == "f") || (schedule_1 == "f" && schedule_2 == "x"))
	      fitness = fitness + 0.1
	   end
	   if ((schedule_1 == "m" && schedule_2 == "a") || (schedule_1 == "a" && schedule_2 == "m"))
	      fitness = fitness + 0.1
	   end
	   if ((schedule_1 == "m" && schedule_2 == "x") || (schedule_1 == "x" && schedule_2 == "m"))
	      fitness = fitness + 0.1
	   end
	   if ((schedule_1 == "a" && schedule_2 == "x") || (schedule_1 == "x" && schedule_2 == "a"))
	      fitness = fitness + 0.1
	   end
	   return fitness
	end 

	# guardo el mejor cromosoma para ser visualizado
	def setBestCromosoma(indiv)
		@bestCromosoma = indiv
	end
	def getBestCromosoma
		@bestCromosoma
	end

	# get optimum fitness
        def getMaxFitness
		maxFitness = lenghNQueens
		return maxFitness
	end 
end
