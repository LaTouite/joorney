class Suggestion < ApplicationRecord
  belongs_to :survey

  TOPICS = ['Dates', 'Destination', 'Budget/participant', 'Thématiques'].freeze
end
