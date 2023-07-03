class PlacePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def resolve
      user.admin? ? scope.all : scope.where(user: user)
    end

  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    (record.user == user && record.validation == false) || user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    (record.user == user && record.validation == false) || user.admin?
  end

  def admin?
    user.admin?
  end
end
