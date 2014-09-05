class PaymentsController < ApplicationController

	def index
		
	end
	def new
		@payment = Payment.new
	end
	def create
		@payment = Payment.new
		puts 'xxxxxxxxxxxxxxxxxxxxxxxxxxx'
		puts ">> entre a create"
		if @payment.submit(params[:payment])

			flash[:success]= "Su pago creado exitosamente "
			url= "https://www.pagofacil.net/st/public/Wsrtransaccion/index/format/json?method=transaccion&data[nombre]=#{@payment.nombre}&data[apellidos]=#{@payment.apellidos}&data[numeroTarjeta]=#{@payment.numero_tarjeta}&data[cvt]=#{@payment.cvt}&data[cp]=#{@payment.cp}&data[mesExpiracion]=#{@payment.mes_expiracion}&data[anyoExpiracion]=#{@payment.anyo_expiracion}&data[monto]=#{@payment.monto}&data[idSucursal]=9ecd1c7a86e0e33f612bf61b0755a8393e567df3&data[idUsuario]=c079a5d147f7d69857bcdff096078831d6594f75&data[idServicio]=3&data[email]=#{@payment.email}&data[telefono]=#{@payment.telefono}&data[celular]=#{@payment.celular}&data[calleyNumero]=#{@payment.calle_y_numero}&data[colonia]=#{@payment.colonia}&data[municipio]=#{@payment.municipio}&data[estado]=#{@payment.estado}&data[pais]=#{@payment.pais}"
			puts "Lectura de url"
			encoded_url = URI.encode(url)
			http_request = Net::HTTP.get_response(URI.parse(encoded_url)).body
			puts ">> entre a decodificar el json"
		 	data = ActiveSupport::JSON.decode(http_request) #.to_json
			puts ">> entre a asignar data"
			@payment.response = data
			render 'index'
		else
			render 'new'
		end
		puts 'xxxxxxxxxxxxxxxxxxxxxxxxxxx'
	end
end
