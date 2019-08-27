class Event < ApplicationRecord
  belongs_to :user
  has_many :userevents
  has_many :surveys

  validates :name, presence: true
  validates :event_category, presence: true, inclusion: { in: ["EVJF", "EVG", "Anniversaire", "Weekend", "Autre"] }
  validates :token, presence: true, uniqueness: true

  mount_uploader :photo, PhotoUploader
end
