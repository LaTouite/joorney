class Survey < ApplicationRecord
  belongs_to :event, optional: true
  has_many :suggestions, dependent: :destroy

  validates :name, presence: true
end
