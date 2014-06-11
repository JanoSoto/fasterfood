class Compuesto < ActiveRecord::Base
	has_and_belongs_to_many :basicos
end
