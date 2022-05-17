#   1. Crear las clases Usuario y CuentaBancaria. (1 Punto)
#   2. Crear el constructor de la clase CuentaBancaria que reciba el nombre del banco, el número de cuenta y el saldo (el saldo por defecto será cero). (1 Punto)
#   3. Crear el método transferir en la clase Cuenta que reciba un monto y otra cuenta. Este método restará del saldo actual el monto y aumentará el saldo de la otra cuenta en el mismo monto. (1 Punto)
#   Es necesario que exista el attr_writer o attr_accessor del saldo para acceder al saldo de la otra cuenta.
#   4. Probar creando dos cuentas cada una con un saldo de 5000 y transferir el total de una cuenta a la otra.
#   5. Crear el constructor de Usuario que reciba el nombre del usuario y un arreglo con al menos 1 cuenta bancaria. (1 Punto)
#   6. Crear el método saldo total que devuelva la suma de todos los saldos del usuario. (1 Punto)

# Requisito 1: Crear clase CuentaBancaria
class CuentaBancaria
  attr_accessor :saldo #requisito 3: attr_accessor
  def initialize (banco, numero_cuenta, saldo = 0) #Requisito 2: Creando constructores
    @banco = banco
    @numero_cuenta = numero_cuenta
    @saldo = saldo
  end
  def transferir (monto, cuenta_destino) #Requisito 3: Método transferir
    @saldo -= monto
    cuenta_destino.saldo += monto
  end
end
# Requisito 1: Crear clase Usuario
class Usuario
    attr_accessor :nombre, :cuentas
    def initialize(nombre, cuenta)
      @nombre = nombre
      @cuentas = []
      @cuentas.push cuenta
      @array_saldos
    end
    def saldo_total #Requisito 6: Método saldo_total
      @array_saldos = @cuentas.map do |e|
        e.saldo
      end
      @array_saldos.sum
    end
  end

# Requisito 4: Creación de 2 cuentas.
cuenta1 = CuentaBancaria.new("BancoEstado", "123456789", 5000)
cuenta2 = CuentaBancaria.new("Scotiabank", "987654321", 5000)

# Se muestran los saldos antes de efectuar la transferencia
puts "---------------------------------"
puts "Saldos antes de la transferencia"
puts "Cuenta 1: #{cuenta1.saldo}"
puts "Cuenta 2: #{cuenta2.saldo}"
puts "---------------------------------"

# Se realiza la transferencia hacia la cuenta_destino
cuenta1.transferir(5000, cuenta2)

# Se muestran los saldos luego de efectuada la transferencia
puts "Saldos después de la transferencia"
puts "Cuenta 1: #{cuenta1.saldo}"
puts "Cuenta 2: #{cuenta2.saldo}"
puts "---------------------------------"


# Utilizando el constructor de Usuario para asignar el nombre del cliente a una cuenta
usuario1= Usuario.new("Juan Perez", cuenta1)

# Agregando una nueva cuenta a la instancia usuario1
usuario1.cuentas.push cuenta2

# Mostrando el resultado de la suma
puts "El Saldo final de la cuenta de #{usuario1.nombre} es: #{usuario1.saldo_total}"
