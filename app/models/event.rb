class Event < ApplicationRecord
  belongs_to :user
  has_many :user_events
  has_many :surveys
  has_many :event_activities
  has_many :activities, through: :event_activities
  has_secure_token

  EVENT_CATEGORIES = ["EVJF", "EVG", "Anniversaire", "Weekend", "Autre"].freeze
  THEMATICS = ["Culture", "Sports nautiques", "Sports extrêmes", "Sensation", "Gastronomie", "Bien-être", "Nature", "Sports mécaniques", "Ludique", "Loisirs créatifs"].freeze

  validates :name, presence: true
  validates :event_category, presence: true, inclusion: { in: EVENT_CATEGORIES }
  #validates :token, presence: true, uniqueness: true

  mount_uploader :photo, PhotoUploader

  geocoded_by :accomodation_address
  after_validation :geocode, if: :will_save_change_to_accomodation_address?

  # after_create :populate_event
  def populate_event
    # background job (lance au bout de 10 sc)
    FakeJob.set(wait: 5.seconds).perform_later(self.id)
      # user = User.last
      # self is the event (mean current_event)
  end
end
