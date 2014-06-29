class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      #user ||= User.new # guest user (not logged in)
      #user = User.new
      #user.rol = User::INVITADO
      #can sign_in User
    end
      
    if user and user.rol
      if user.rol == User::ADMINISTRADOR
        can :manage, :all
        can :manage, User
      elsif user.rol == User::VENDEDOR
        can :read, :all
      elsif user.rol == User::COCINERO
        can :manage, :preparar
        #can :read, :preparar
      end
    end

    #can :read, Compuesto
    #if !user.role.nil?
     #   if user.role.name == "Administrador"
      #      can :manage, Compuesto
      #  else
      #      can :read, Compuesto
      #  end
    #end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
