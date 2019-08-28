class Survey < ApplicationRecord
  belongs_to :event, optional: true
  has_many :topics

  validates :name, presence: true
end
