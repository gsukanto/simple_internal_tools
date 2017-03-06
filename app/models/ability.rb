class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, [:dashboard, SmsStatus]
    
    if user
      can :access, :rails_admin
      can :dashboard

      if (user.has_role? :admin)
        can :manage, :all
      end

      if (user.has_role? :sms)
        can :manage, SmsStatus
      end
    end

  end
end
