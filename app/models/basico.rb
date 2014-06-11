class Basico < ActiveRecord::Base
	has_and_belongs_to_many :compuestos
end
