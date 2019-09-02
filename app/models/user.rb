class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :profile_picture, PhotoUploader

  has_many :userevents
  has_many :events

  validates :first_name, presence: true
  validates :last_name, presence: true
end
