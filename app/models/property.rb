class Property < ApplicationRecord
  belongs_to :user
  has_one :address

  context 'validation tests' do
  end

  context 'scope tests' do
  end

end
