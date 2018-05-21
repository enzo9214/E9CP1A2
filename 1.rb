class Table
  def initialize(nombre, recaudacion1, recaudacion2, recaudacion3, recaudacion4)
    @mesa = {}
    @mesa['nombre'] = nombre
    @mesa['values'] = [recaudacion1.to_i, recaudacion2.to_i, recaudacion3.to_i, recaudacion4.to_i]
  end

  def promedioRecaudacion
    @mesa['values'].inject(0) { |sum, valor| sum + valor}/4
  end

  def mayorRecaudacion
    dia_mayor_recaudacion = @mesa['values'].index(@mesa['values'].max)
    [@mesa['nombre'], "Dia #{dia_mayor_recaudacion + 1}", @mesa['values'][dia_mayor_recaudacion]]
  end
end



def instanciarArchivo
  file = File.open('casino.txt', 'r')
  data = file.readlines
  file.close
  
  data.each do |index|
    ls = index.split(', ')
    $mesas.push(Table.new(*ls))
  end  
end  

$mesas = []
promedioTotal = 0

instanciarArchivo

$mesas.each do |mesa|
  print mesa.mayorRecaudacion
  promedioTotal += mesa.promedioRecaudacion
end

puts promedioTotal/$mesas.count