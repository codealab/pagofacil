class PaymentsController < ApplicationController
require 'json'
require 'net/http'
require 'net/https'
require 'uri'
	def index
		
	end
	def new
		@payment = Payment.new
	end
	def create
		@payment = Payment.new
		puts"entreeeeeeeeeeeeeeeeeeeeee a quiiiiiiiiiíiiiiiiiiiii"
		puts params
		if @payment.submit(params[:payment])

			flash[:success]= "Su pago creado exitosamente "
			url= "https://www.pagofacil.net/st/public/Wsrtransaccion/index/format/json?method=transaccion&data[nombre]=#{@payment.nombre}&data[apellidos]=#{@payment.apellidos}&data[numeroTarjeta]=#{@payment.numero_tarjeta}&data[cvt]=#{@payment.cvt}&data[cp]=#{@payment.cp}&data[mesExpiracion]=#{@payment.mes_expiracion}&data[anyoExpiracion]=#{@payment.anyo_expiracion}&data[monto]=#{@payment.monto}&data[idSucursal]=9ecd1c7a86e0e33f612bf61b0755a8393e567df3&data[idUsuario]=c079a5d147f7d69857bcdff096078831d6594f75&data[idServicio]=3&data[email]=#{@payment.email}&data[telefono]=#{@payment.telefono}&data[celular]=#{@payment.celular}&data[calleyNumero]=#{@payment.calle_y_numero}&data[colonia]=#{@payment.colonia}&data[municipio]=#{@payment.municipio}&data[estado]=#{@payment.estado}&data[pais]=#{@payment.pais}"
puts"entreeeeeeeeeeeeeeeeeeeeee"
			http_request = Net::HTTP.get_response(URI.parse(url)).body
			
		 data = ActiveSupport::JSON.decode(http_request) #.to_json
puts"entreeeeeeeeeeeeeeeeeeeeee  ttttttttttttttttttttttt"
			@payment.response = data

			render 'index'
			puts"entreeeeeeeeeeeeeeeeeeeeee xxxxxxxxxxxxxxxxxxxxx"
			puts url
			puts"entreeeeeeeeeeeeeeeeeeeeee ooooooooooooooo"
		else
			render 'new'
		end

	end
end
