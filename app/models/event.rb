class Event < ApplicationRecord
  belongs_to :user
  has_many :userevents

  validates :name, presence: true
  validates :event_category, presence: true, inclusion: { in: ["EVJF", "EVG", "Anniversaire", "Weekend", "Autre"] }
  validates :token, presence: true, uniqueness: true
end
