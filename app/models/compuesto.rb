class Compuesto < ActiveRecord::Base
	has_many :composicion
	# distincs es para decir que un compuesto solo puede tener productos basicos unicos
	has_many :basico, -> { distincs }, :through => :composicion
end
