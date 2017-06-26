class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.is?(:admin)
      can :manage, :all
      puts "admin"
    elsif user.is?(:user)
      can :read, :all
      can :manage, :advert
      puts "user"
    elsif user.is?(:merchant)
      can :read, :all
      can :manage, :merchant_page
      puts "mercha"
    else
      can :read, :all
    end

  end
end
