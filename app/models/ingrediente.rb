class Ingrediente < ActiveRecord::Base
	has_many :merma_ingredientes
	has_many :lotes
	validates :nombre, :stock_actual, :stock_critico, :stock_ideal, presence: true
	validates :stock_actual, :stock_critico, :stock_ideal, :numericality => { :greater_than_or_equal_to => 0, only_integer: true }

end
