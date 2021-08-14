require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures first name is present' do
      user = User.new(last_name: 'Holden', email: 'james.holder@example.com').save
      expect(user).to eq(false)
    end

    it 'ensures last name is present' do
      user = User.new(first_name: 'James', email: 'james.holder@example.com').save
      expect(user).to eq(false)
    end

    it 'ensures email is present' do
      user = User.new(first_name: 'James', last_name: 'Holden').save
      expect(user).to eq(false)
    end

    it 'should save successfully' do
      user = User.new(first_name: 'James', last_name: 'Holden', email: 'james.holder@example.com').save
      expect(user).to eq(true)
    end
  end

  context 'scope tests' do
    let(:params) { { first_name: 'James', last_name: 'Holden', email: 'james.holder@example.com' } }
    before(:each) do
      User.new(params).save
      User.new(params).save
      User.new(params).save
      User.new(params.merge(is_host: false)).save
      User.new(params.merge(is_host: true)).save
      User.new(params.merge(is_host: true)).save
    end

    it 'should return number of none hosts' do
      expect(User.is_user.count).to eq(4)
    end

    it 'should return number of hosts' do
      expect(User.is_host.count).to eq(2)
    end
  end
end
