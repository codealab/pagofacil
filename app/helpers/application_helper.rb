module ApplicationHelper
	def mark_required(object, attribute)
		"*" if object.class.validators_on(attribute).map(&:class).include? ActiveModel::Validations::PresenceValidator
 		# <%= mark_required(@payment, :numero_tarjeta) %>
	end
end
