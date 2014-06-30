class Proveedor < ActiveRecord::Base
	#validates_format_of :rut_proveedor, :with => /\A(\d{1,3})\.(\d{1,3})\.(\d{1,3})\-(k|\d{1})\Z/i, :message => "no válido."
	validates_with RUTValidatorProveedor
	validates :nombre_proveedor, presence: true
	validate :telefono_proveedor, :numericality => { :greater_than_or_equal_to => 0}
	validates :rut_proveedor  , uniqueness: true

end
