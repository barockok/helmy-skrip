class Ability
  include CanCan::Ability
  attr_reader :user
  def initialize(user)
    @user = user || User.new
    cannot :manage, :all
    profile
    user.roles.each{|role| send("#{role}".to_sym) if respond_to?("#{role}".to_sym) }
    # can :manage , :all
  end
  def profile
    can [:profile,:edit_profile, :update_profile, :edit_password, :update_password], User, :id => user.id
  end
  def admin
    can :manage , :all
  end

  def cs
    can :manage, Nasabah
    cannot :approve, Nasabah
    can :manage , AdministrationFee
  end

  def teller
    can :manage, Transaction
  end

  def direktur
    can :manage, Transaction
    can :manage, Nasabah
    cannot [:edit, :update, :new, :create, :destroy], Nasabah
    can :manage, :reports
  end

end
