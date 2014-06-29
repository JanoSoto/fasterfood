class DetallesBasico < ActiveRecord::Base
	belongs_to :basico
	belongs_to :ingrediente
end
