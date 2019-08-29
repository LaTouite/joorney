class Suggestion < ApplicationRecord
  belongs_to :topic
  belongs_to :survey

  TOPICS = ["Destination", "Budget par personne", "Date", "Thématique"]
end
