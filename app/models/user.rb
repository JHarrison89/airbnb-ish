class User < ApplicationRecord
  has_many :properties
  has_one :address

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true

  scope :is_user, -> { where(is_host: false) }
  scope :is_host, -> { where(is_host: true) }
end
