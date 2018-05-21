
$r = (1..10).to_a

class Roulette
	def initialize()
		@azar = nil
	end

	def play(numero)
		@azar = $r[rand(10)]
		puts "El numero al azar es #{@azar}"
		almacenar(numero)
	end	

	def almacenar(numero)
		if @azar != nil
			File.open('roulette_history.txt','a'){|file| file.puts(@azar)}
			puts numero
			puts @azar
			if numero == @azar
				puts "Ganaste"
				File.open('winners.txt','a'){|file| file.puts(@azar)}
			end	
		end	
	end

	def leerRoulette
		numbers = []
		sort = {}
		repeticiones = {}

	    file = File.open('roulette_history.txt','r')
	    data = file.readlines

	    data.each do |numero|
	    	numbers.push(numero.to_i)
	    end	

	    sort = numbers.group_by{ |value| value}

	    sort.each {|key, value| repeticiones.store(key,value.length)}
	     

	    puts "Veces: #{repeticiones.invert.max[0]} Numero: #{repeticiones.invert.max[1]}"
	end
end

juego = Roulette.new
juego.play(5)
juego.leerRoulette