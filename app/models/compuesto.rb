class Compuesto < ActiveRecord::Base
	has_many :composicion
	# distinct es para decir que un compuesto solo puede tener productos basicos unicos
	has_many :basico, -> { distinct }, :through => :composicion
end
