class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :dashboard
    
    if user
      can :access, :rails_admin
      can :dashboard

      if (user.has_role? :admin)
        can :manage, :all
      end
    end

  end
end
