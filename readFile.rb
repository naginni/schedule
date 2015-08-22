require 'csv'
require 'mysql2'

class ReadFiles 
   # se intancian las variables en forma de array cada linea se almacena en su respectiva variable
   def initialize
      @medicos = @actividades = @medi_acti = Array.new
      @consultorios = Hash.new
   end

   # conexion a la Base de Datos
   def mysqlConnect
      databasename = 'TG_4'
      #@connect = Mysql.new('hostname', 'username', 'password', 'database')
      connect = Mysql2::Client.new(:host => 'localhost', :username => 'root', :password => 'root', :database => databasename)
      return connect
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
   # consulta a la BD para obtener los consultorios
   def readConsultorios
      client = mysqlConnect
      results = client.query('select * from consultorios')
      client.close
      results.each do |row| 
	 @consultorios[row['id']] = row['nombre']
      end
      return @consultorios
   end 
   # consulta a la BD para obtener las actividades
   def readActividades
      client = mysqlConnect
      result = client.query('SELECT cups AS nombre, nombre AS cups FROM cargos')
      client.close
      result.each do |row|
	 @actividades << { row['cups'] => row['nombre'] }
      end
   end 
   # consulta a la BD para obtener los medicos que se necesitan agendas
   def readMediActi
      client = mysqlConnect
      result = client.query("SELECT * FROM user_cargo_works WHERE estado = 1")
      client.close
      result.each do |row|
	 arraydate = [row['monday'], row['tuesday'], row['wednesday'], row['thursday'], row['friday']]
	 @medi_acti << { "id" => row['id'], "medico" => row['user_id'], "actividad" => row['cargo_id'], "consultorio" => "", "fecha" => arraydate, "fitness" => 0 } 
      end
      return @medi_acti
   end 
   ## insertar la solucion a la bd
   def insertOutSolutions(sqlStructure)
      values = "#{sqlStructure}"
      values[0] = values[values.length-1] = ""
      replacements = [ ["[","("],["]",")"]]
      replacements.each {|replacement| values.gsub!(replacement[0],replacement[1])} 

      client = mysqlConnect
      insert = "INSERT INTO out_put_solutions (monday, tuesday, wenesday, thursday, friday) VALUES #{values};"
      results = client.query(insert)
      client.close
      return results
   end 
   # eliminar la informacion no necesaria de la bd
   def deleteOutSolutions
      client = mysqlConnect
      results = client.query("TRUNCATE out_put_solutions")
      client.close
      return results
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
