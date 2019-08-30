class Suggestion < ApplicationRecord
  belongs_to :survey

  TOPICS = ['Dates', 'Destination', 'Budget/participant', 'Thématiques'].freeze

  def date_value
    return "#{self.start_date}-#{self.end_date}"
  end

end
