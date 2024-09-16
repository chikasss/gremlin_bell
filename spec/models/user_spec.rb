require 'rails_helper'
user = User.new(
  username: 'TestUsername',
  email: 'testuser@mail.com',
  password: 'password',
  first_name: 'Test',
  last_name: 'User',
  prefecture: 'Hokkaido'
)

RSpec.describe User, type: :model do
  it 'user has an email' do
    expect(user.email).to eq('testuser@mail.com')
  end

  context 'username validations' do
    it 'user has a username' do
      expect(user.username).to eq('TestUsername')
    end

    it 'invalid user without a username' do
      user.username = nil
      expect(user.valid?).to eq(false)
    end
    it 'username is invalid when under 3 characters'  do
      user.username = "sn"
      expect(user.errors.messages[:username]).to include("username must be between 3 and 20 characters long")
    end
    it 'username is invalid when over 20 characters'  do
      user.username = 'thisisaverylongusername'
      expect(user.errors[:username]).to include("username must be between 3 and 20 characters long")
    end
  end
  context "name validations" do
    it 'user has a first name' do
      expect(user.first_name).to eq('Test')
    end
    it 'user has a last name' do
      expect(user.last_name).to eq('User')
    end
  end
end
