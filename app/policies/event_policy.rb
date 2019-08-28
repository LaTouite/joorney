class EventPolicy < ApplicationPolicy
  def new?
    return true
  end

  def create?
    return true
  end

  def invite?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
