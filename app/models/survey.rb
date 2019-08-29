class Survey < ApplicationRecord
  belongs_to :event, optional: true
  has_many :suggestions

  validates :name, presence: true
end
