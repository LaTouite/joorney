class SurveyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    return true
  end

  def create?
    true
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
end
