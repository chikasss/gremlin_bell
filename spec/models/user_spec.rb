require 'rails_helper'
user = User.new(
  username: 'TestUsername',
  email: 'testuser@mail.com',
  password: 'password',
  first_name: 'Test',
  last_name: 'User',
  prefecture: 'Hokkaido'
)

user.save

user2 = User.new(
  username: 'TestUsername',
  email: 'testuser2@mail.com',
  password: 'password',
  first_name: 'Test',
  last_name: 'User2',
  prefecture: 'Tokyo'
)

user2.save

RSpec.describe User, type: :model do
  it 'user has an email' do
    expect(user.email).to eq('testuser@mail.com')
  end

  it 'user has a username' do
    expect(user.username).to eq('TestUsername')
  end

  it 'user has a first name' do
    expect(user.first_name).to eq('Test')
  end

  it 'user has a last name' do
    expect(user.last_name).to eq('User')
  end

  context 'username validations' do

    it 'returns an invalid user if username is not unique' do
      expect(user2.valid?).to eq(false)
      expect(user2.errors.messages[:username]).to include('has already been taken')
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
end
