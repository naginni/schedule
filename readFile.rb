require 'csv'

class ReadFiles

   # se intancian las variables en forma de array cada linea se almacena en su respectiva variable
   def initialize
      @medicos = @actividades = @medi_acti = Array.new
      @consultorios = Hash.new
   end

   # se definen los medicos como: hashe=>array=>hashe
   # el hashe contiene en la key el identificador del medico con toda su informacion que se encuentra en un array
   # y el array contiene el segundo hashe para el acceso a la informacion mas rapido
   def readMedicos 
      CSV.foreach("files/medicos.csv", :headers => true) do |row|

	# hashe = {"l"=>row['L'], "m"=>row['M'], "mi"=>row['MI'], "j"=>row['J'], "v"=>row['V']}
	# float_time = convertWeekToFloat(hashe)
	 arraydate = [row['L'], row['M'], row['MI'], row['J'], row['V']] 
	 @medicos << { "cc" => row['cc'], "name" =>row['nombre'], "lastname"=>row['apellido'], "fecha" => arraydate } 
      end
      return @medicos
   end

   def readConsultorios
      CSV.foreach("files/consultorios.csv", :headers => true) do |row|
	 @consultorios[row['id']] = row['consultorio']
      end 
      return @consultorios
   end

   def readActividades
      CSV.foreach("files/actividades.csv", :headers => true) do |row|
	 @actividades << { row['cups'] => row['nombre'] }
      end
   end

   # se obtine el cromomosoma de forma aleatorio sin datos repetidos
   def readMediActi
      CSV.foreach("files/medi_activ.csv", :headers => true) do |row|
	 arraydate = [row['L'], row['M'], row['MI'], row['J'], row['V']]
	 @medi_acti << { "id" => row['id'], "medico" => row['medico_id'], "actividad" => row['actividad_id'], "consultorio" => "", "fecha" => arraydate, "fitness" => 0 }
      end
      return @medi_acti
   end


   def getCromosoma
      length = @medi_acti.length
      cromosoma = Array.new(length)
      i=0
      while i < length do 
	 gene = rand(length)
	 if(cromosoma[gene] == nil) 
	    cromosoma[gene] = @medi_acti[i]
	    i +=1
	 end
      end
      return cromosoma
   end 

   # se transforma los horarios de los medicos a un float
   def convertWeekToFloat(hashe)
      #x = not wordk, f = full time, m = morning, a = afternoon
      int = 0
      float_time = ''
      hashe.each do |key, value|
	 case value
	 when "x"
	    int += 1
	    float_time += "#{int}0"
	 when "f"
	    int += 1
	    float_time += "#{int}1"
	 when "m"
	    int += 1
	    float_time += "#{int}2"
	 when "a"
	    int += 1
	    float_time += "#{int}3"
	 end 
      end
      return float_time 
   end
end


#      quote_chars = %w(" | ~ ^ & *)
#      begin
#	   report = CSV.read("files/consultorios.csv", headers: :first_row, quote_char: quote_chars.shift)
#      rescue CSV::MalformedCSVError
#	   quote_chars.empty? ? raise : retry 
#      end
