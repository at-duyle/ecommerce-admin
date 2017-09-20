class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    user ||= Admin.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    elsif user.manager?
      can :manage, Shop, id: user.shop_id
      can :manage, Product, shop_id: Shop.find(user.shop_id).id
      can :index, :main_admin
      can :read, Category
      can :read, SubCategory
    else
      cannot :manage, :all
      # can :manage, Shop, admin_id: :user.id
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
