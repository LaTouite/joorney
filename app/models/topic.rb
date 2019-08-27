class Topic < ApplicationRecord
  belongs_to :survey
  has_many :suggestions

  validates :name, presence: true
end
