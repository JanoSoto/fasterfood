class Compuesto < ActiveRecord::Base
	attr_accessor :tipo
	has_many :composicion
	# distinct es para decir que un compuesto solo puede tener productos basicos unicos
	has_many :basico, -> { distinct }, :through => :composicion
	accepts_nested_attributes_for :basico
	accepts_nested_attributes_for :composicion
end
