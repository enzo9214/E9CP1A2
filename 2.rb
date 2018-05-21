require 'date'

class Course
  def initialize(nombre, fecha_inicio, fecha_termino)
    @nombre = nombre
    @fecha_inicio = Date.parse(fecha_inicio)
    @fecha_termino = Date.parse(fecha_termino)
  end

  def consultaPrevio(fecha = Date.today)
    if fecha > Date.parse('2018-12-25')
      raise ArgumentError, 'Fecha posterior al 01-01-2018'
    else
      if fecha < @fecha_inicio
        return true
      else
        return false
      end
    end
  end

  def consultaPosterior(fecha = Date.today)
    if fecha > Date.parse('2018-12-25')
      raise ArgumentError, 'Fecha posterior al 01-01-2018'
    else
      if fecha < @fecha_termino
        return true
      else
        return false
      end
    end
  end
end

def leerArchivo
  file = File.open('cursos.txt','r')
  data = file.readlines
  ls = []
  data.each do |line|
     ls = line.split(', ')
     $cursos.push(Course.new(*ls))
  end 
end 

$cursos = []
leerArchivo

$cursos.each do |curso|
  puts curso.consultaPrevio(Date.parse('2017-01-01'))
end