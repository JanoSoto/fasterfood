class Ingrediente < ActiveRecord::Base
	has_many :merma_ingredientes
	has_many :lotes
end
