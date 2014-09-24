class Payment
  # Rails 4: include ActiveModel::Model
  include ActiveModel::Model
  extend ActiveModel::Naming
  include ActiveModel::Conversion
  include ActiveModel::Validations

  validates_presence_of :monto, :numero_tarjeta, :cvt,:mes_expiracion, :anyo_expiracion, :nombre, :apellidos, :email, :telefono, :celular, :calle_y_numero, :colonia, :cp, :municipio, :estado, :pais



  
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  
   validates_numericality_of :monto,  {:greater_than_or_equal_to => 100 , message: " debe ser mayor o igual a $100 pesos"}
  

  validates :numero_tarjeta, length: {
    minimum: 16,
    maximum: 16,
   
    too_long: " %{value} es demasiado largo (mínimo %{count} caracteres)",
    too_short: "%{value} es demasiado corto (mínimo %{count} caracteres)"
  }
  validates :cvt, length: {
    minimum: 4,
    maximum: 4,
   
    too_long: " %{value}  es demasiado largo (mínimo %{count} caracteres)",
    too_short: "%{value}  es demasiado corto (mínimo %{count} caracteres)"
  }

  
  validates :mes_expiracion, length: {
    minimum: 2,
    maximum: 2,
   
    too_long: "debe ser %{count} digitos",
    too_short: "debe ser %{count} digitos"
  }
  validates :anyo_expiracion, length: {
    minimum: 2,
    maximum: 2,
   
    too_long: "debe ser %{count} digitos",
    too_short: "debe ser %{count} digitos"
  }

  

  validates :celular, length: {
    minimum: 10,
    maximum: 10,
   
    too_long: " %{value}  es demasiado largo (mínimo %{count} caracteres)",
    too_short: "%{value}  es demasiado corto (mínimo %{count} caracteres)"
  }
  validates :telefono, length: {
    minimum: 10,
    maximum: 10,
   
    too_long: "%{value}  es demasiado largo (mínimo %{count} caracteres) ",
    too_short: "%{value} es demasiado corto (mínimo %{count} caracteres)"
  }



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

  
  def enviar
    url= "https://www.pagofacil.net/ws/public/Wsrtransaccion/index/format/json?method=transaccion&data[nombre]=#{self.nombre}&data[apellidos]=#{self.apellidos}&data[numeroTarjeta]=#{self.numero_tarjeta}&data[cvt]=#{self.cvt}&data[cp]=#{self.cp}&data[mesExpiracion]=#{self.mes_expiracion}&data[anyoExpiracion]=#{self.anyo_expiracion}&data[monto]=#{self.monto}&data[idSucursal]=e84f1d3b924c07e52a8c999047373106c10e582c&data[idUsuario]=82d4a1cf37137e7147602a7e6fa64d8e6c0c0b9c&data[idServicio]=3&data[email]=#{self.email}&data[telefono]=#{self.telefono}&data[celular]=#{self.celular}&data[calleyNumero]=#{self.calle_y_numero}&data[colonia]=#{self.colonia}&data[municipio]=#{self.municipio}&data[estado]=#{self.estado}&data[pais]=#{self.pais}"

    puts "Lectura de url"

      encoded_url = URI.encode(url)
      http_request = Net::HTTP.get_response(URI.parse(encoded_url)).body
      puts ">> entre a decodificar el json"
      data = ActiveSupport::JSON.decode(http_request) #.to_json
    
    puts ">> entre a asignar data"
      self.response = data


  end


   
end

