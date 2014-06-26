class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role

	#validations
	validates :rut  , uniqueness: true, presence: true
	validates :email, uniqueness: true, presence: true
	validates :password, presence: true
	validates :password_confirmation, presence: true
	
	validates :rut, presence: true
	validates :email, presence: true
	validates :password, presence: true
	validates :password_confirmation, presence: true
	validates :nombre, presence: true
	validates :apellido_paterno, presence: true
	validates :apellido_materno, presence: true
	validates :telefono, presence: true

end
