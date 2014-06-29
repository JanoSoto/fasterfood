class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :role

  INVITADO = 0
  COCINERO = 1
  VENDEDOR = 3
  ADMINISTRADOR = 5

  def self.estados
  	{
  		'INVITADO'   => INVITADO,
  		'COCINERO'   => COCINERO,
  		'VENDEDOR'      => VENDEDOR,
  		'ADMINISTRADOR'    => ADMINISTRADOR,
  	}
  end

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
	validates :rol, inclusion: { in: [User::COCINERO, User::VENDEDOR, User::ADMINISTRADOR], message: "%{value} invalido" }

end
