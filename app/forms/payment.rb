class Payment
	# Rails 4: include ActiveModel::Model
	extend ActiveModel::Naming
	include ActiveModel::Conversion
	include ActiveModel::Validations
	validates_presence_of :nombre, :apellidos, :numero_tarjeta, :cp, :cvt, :monto, :mes_expiracion, :anyo_expiracion, :email, :telefono, :celular, :calle_y_numero, :colonia, :municipio, :estado, :pais
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

	

	attr_accessor  :nombre, :apellidos, :numero_tarjeta, :cp, :cvt, :monto, :mes_expiracion, :anyo_expiracion, :email, :telefono, :celular, :calle_y_numero, :colonia, :municipio, :estado, :pais, :response

	def persisted?
		false
	end

	def submit(params)
		self.nombre = params[:nombre]
		self.apellidos = params[:apellidos]
		self.numero_tarjeta = params[:numero_tarjeta]
		self.cp = params[:cp]
		self.cvt = params[:cvt]
		self.monto = params[:monto]
		self.mes_expiracion = params[:mes_expiracion]
		self.anyo_expiracion = params[:anyo_expiracion]
		self.email = params[:email]
		self.telefono = params[:telefono]
		self.celular = params[:celular]
		self.calle_y_numero = params[:calle_y_numero]
		self.colonia = params[:colonia]
		self.municipio = params[:municipio]
		self.estado = params[:estado]
		self.pais = params[:pais]

		valid?

	end
end
