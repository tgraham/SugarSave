class Ability
  include CanCan::Ability
  
  def initialize(user)
    alias_action :show, :to => :view
    
    user ||= User.new #for non-logged in visitors
    
    if user.role == "admin"
      can :manage, :all
    else
      if user.role == "metro"
        can :read, :all
      else
        can :view, Deal
        can :view, Charity
        can [:picker], City
        can :create, User
        can [:show, :edit, :update], User do |current_user|
          user.id == current_user.id || user.role == "admin"
        end
      end
    end
    
  end
end