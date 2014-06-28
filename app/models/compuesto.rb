class Compuesto < ActiveRecord::Base
	attr_accessor :tipo
	has_many :composicion
	# distinct es para decir que un compuesto solo puede tener productos basicos unicos
	has_many :basico, -> { distinct }, :through => :composicion
	validates_uniqueness_of :nombre_producto, :message => "Un producto con el mismo nombre ya está registrado"
	validates :precio, :numericality => { :greater_than_or_equal_to => 0}
	accepts_nested_attributes_for :basico
	accepts_nested_attributes_for :composicion
end
