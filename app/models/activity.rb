class Activity < ApplicationRecord
  has_many :event_activities

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :main_photo, PhotoUploader
  mount_uploader :second_photo, PhotoUploader

  CATEGORIES = ["sports sensations", "sports nautiques", "mécanique", "ludique", "activités extérieures", "bien-être", "loisirs créatifs", "fin gourmet", "danse"]

  validates :title, presence: true
  validates :description, presence: true
  validates :unit_price, presence: true
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :schedule, presence: true
  validates :address, presence: true
  validates :min_number_of_participants, presence: true, numericality: { greater_than_or_equal_to:1 }
  validates :max_number_of_participants, presence: true
  # numericality: { greater_than_or_equal_to: min_number_of_participants }
  validates :min_age, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :duration, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :main_photo, presence: true
  validates :second_photo, presence: true
end
