class Address < ApplicationRecord
  belongs_to :property
  belongs_to :user
end
