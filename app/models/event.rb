class Event < ApplicationRecord
 belongs_to :user
 has_many :userevents
 has_many :surveys
 has_secure_token

 EVENT_CATEGORIES = ["EVJF", "EVG", "Anniversaire", "Weekend", "Autre"].freeze
 THEMATICS = ["Culture", "Sports extrêmes", "Sensation", "Gastronomie"].freeze

 validates :name, presence: true
 validates :event_category, presence: true, inclusion: { in: EVENT_CATEGORIES }
 #validates :token, presence: true, uniqueness: true

  mount_uploader :photo, PhotoUploader

end
