class Ability
  include CanCan::Ability

  def initialize(user, params = {})
    can :manage, :all if user
  end

end
