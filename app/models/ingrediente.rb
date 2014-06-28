class Ingrediente < ActiveRecord::Base
	has_many :merma_materials
	has_many :lotes
end
