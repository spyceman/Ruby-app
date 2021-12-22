class Ability
  include CanCan::Ability

  def initialize(user)
       user ||= User.new 
      if user.role?(:admin)
        can :manage, :all
      elsif user.role?(:author)
        can [:create, :read, :update, :delete], [Post, Comment]
      else
        can :read, [Post, Comment]
      end
  end
end
