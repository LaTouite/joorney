class EventActivityPolicy < ApplicationPolicy

  def new?
    return true
  end

  def create?
    return true
  end

  def destroy?
    return true
  end



  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
