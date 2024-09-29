require 'rails_helper'

RSpec.describe Route, type: :model do
  let!(:user) do
    User.create(
      username: 'TestUsername',
      email: 'testuser@mail.com',
      password: 'password',
      first_name: 'Test',
      last_name: 'User',
      prefecture: 'Hokkaido'
    )
  end

  let!(:route) do
    Route.create(
      title: 'TestRoute',
      videos_url: 'www.youtube.com',
      description: 'This is a test route',
      prefecture: 'Hokkaido',
      waypoints: [
        ["140.93342678338806", "42.79543274892502"],
        ["141.09836986142776", "42.86675427633369"],
        ["141.1490391486532", "42.95572467766607"]
      ],
      ride_type: ['Mountainous'],
      road_condition: 'Paved',
      recomended_bikes: ['Sport Bike'],
    )
  end

  # it { should belong_to(:user) }
  # it { should have_many(:comments) }
  # it { should validate_presence_of(:comments) }

  describe 'associations' do
    it 'belongs to a user' do
      r = Route.reflect_on_association(:user)
      expect(r.macro).to eq(:belongs_to)
    end

    it 'has many reviews' do
      r = Route.reflect_on_association(:reviews)
      expect(r.macro).to eq(:has_many)
    end

    it 'has many comments' do
      r = Route.reflect_on_association(:comments)
      expect(r.macro).to eq(:has_many)
    end

    it 'has many landmarks' do
      r = Route.reflect_on_association(:landmarks)
      expect(r.macro).to eq(:has_many)
    end

    it 'has many favorites' do
      r = Route.reflect_on_association(:favorites)
      expect(r.macro).to eq(:has_many)
    end

    it 'has many photos' do
      r = Route.reflect_on_association(:photos)
      expect(r.macro).to eq(:has_many)
    end
  end

  describe 'validations' do
    before { route.title = nil }
    it 'is valid with a title' do
      expect(route.valid?).to eq(false)
    end

    before { route.user_id = nil }
    it 'is invalid without user' do
      expect(route.valid?).to eq(false)
    end
  end

  describe '#minimum_waypoints' do
    before { route.waypoints = ["140.93342678338806", "42.79543274892502"] }
    it 'returns an invalid route when only one waypoint is provided' do
      puts route.waypoints.count
      expect(route.valid?).to eq(false)
    end
  end
end
