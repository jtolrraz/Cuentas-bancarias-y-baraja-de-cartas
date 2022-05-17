#   1 Crear la clase carta con los atributos numero y pinta. (1 Punto)
#   2 Agregar los getters y setters a ambos atributos.
#   3 Crear el constructor de la clase carta que le permita recibir un número del 1 al 13 y la pinta que está indicada por una sola letra. Puede ser Corazón: 'C', Diamante: 'D', Espada: 'E' o Trébol: 'T'. (1 Punto)
#   4 Utilizar el ejercicio Carta creado en la primera parte y dejarlo en el archivo carta.rb.
#   5 Crear la clase baraja en el archivo barajas.rb con el atributo cartas, el cual será un arreglo. (1 Punto)
#   6 Al crear una baraja (constructor) se deben generar todas las combinaciones de números y pinta y guardarse dentro del arreglo cartas.
#   7 Crear el método barajar que debe desordenar el arreglo de cartas Tip: Utilizar .shuffle.
#   8 Crear el método sacar que permita retirar la primera carta de la baraja Tip: Utilizar .pop. (1 Punto)
#   9 Crear el método repartir mano que devolverá un arreglo con las primeras 5 cartas de la baraja. (1 Punto)

require_relative 'carta.rb'
class Baraja
    attr_accessor :cartas #Requisito 5
    def initialize (cartas)
        @cartas = []
        ["C","D","E","T"].each do |pinta| #Requisito 3
            13.times do |numero|
                num = numero + 1
                @cartas.push(Carta.new(num,pinta))
            end
        end
    end
    def barajar #Requisito 7
        @cartas.shuffle!
    end
    def sacar #Requisito 8
        carta = @cartas.pop
        puts "#{carta.pinta}#{carta.numero}"
    end
    def repartir_mano #Requisito 9
        for i in 0..4
            sacar
        end
    end
end

carta = []
barajar= Baraja.new(carta)
barajar.barajar
puts "-----------------------------------------"
puts "Su mano consta de las siguientes cartas:"
puts "-----------------------------------------"
barajar.repartir_mano
puts "-----------------------------------------"