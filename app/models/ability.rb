class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    user ||= Admin.new # guest user (not logged in)
    if user.admin?
      can :manage, User
      can :manage, Admin
      can :manage, Shop
      can :manage, Category
      can :manage, SubCategory
      can :manage, Request
      can :index, :main_admin
      can :index, :revenue
      cannot :destroy, Admin
    elsif user.manager?
      can :manage, Product, shop_id: Shop.find(user.shop_id).id
      can :index, :main_admin
      can :read, Category
      can :read, SubCategory
      can :manage, PurchaseOrder
      can :manage, DeliveryOrder
      can :manage, Admin, manager_id: user.id
      cannot :destroy, Admin, manager_id: user.id
    elsif user.partner?
      can :index, :main_admin
      can :read, Category
      can :read, SubCategory
      can :manage, PurchaseOrder
      can :manage, DeliveryOrder
      can :manage, Product, shop_id: Shop.find(user.shop_id).id
    else
      cannot :manage, :all
    end
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
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
