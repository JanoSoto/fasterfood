class Basico < ActiveRecord::Base
	has_many :composicion
	has_many :compuesto, :through => :composicion
end
