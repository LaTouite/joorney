class SuggestionPolicy < ApplicationPolicy

  def index?
    return true
  end

  def create?
    record.survey.event.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
