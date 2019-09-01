class EventPolicy < ApplicationPolicy
  def new?
    return true
  end

  def create?
    return true
  end

  def show?
    return true
  end

  def edit?
    return true
  end

  def update?
    return true
  end

  def invite?
    true
  end

  def accomodation?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
