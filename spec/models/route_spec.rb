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
      user_id: user
    )
  end

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
    context 'when title is nil' do
      before { route.title = nil }
      it 'is invalid without a title' do
        expect(route.valid?).to eq(false)
        expect(route.errors[:title]).to include("can't be blank")
      end
    end

    context 'when user_id is nil' do
      before { route.user_id = nil }
      it 'is invalid without a user_id' do
        expect(route.valid?).to eq(false)
        expect(route.errors[:user]).to include("must exist")
      end
    end

    context 'when description is nil' do
      before { route.description = nil }
      it 'is invalid without a description' do
        expect(route.valid?).to eq(false)
        expect(route.errors[:description]).to include("can't be blank")
      end
    end

    context 'when road condition is nil' do
      before { route.road_condition = nil }
      it 'is invalid without a road condition' do
        expect(route.valid?).to eq(false)
        expect(route.errors[:road_condition]).to include("is not included in the list")
      end
    end

    context 'when ride type is nil' do
      before { route.ride_type = nil }
      it 'is invalid without a ride type' do
        expect(route.valid?).to eq(false)
        expect(route.errors[:ride_type]).to include("is not included in the list")
      end
    end

    context 'when prefecture is nil' do
      before { route.prefecture = nil }
      it 'is invalid without a prefecture' do
        expect(route.valid?).to eq(false)
        expect(route.errors[:prefecture]).to include("is not included in the list")
      end
    end
  end

  describe '#minimum_waypoints' do
    before { route.waypoints = [["140.93342678338806", "42.79543274892502"]] }
    it 'is invalid with only one waypoint' do
      expect(route.valid?).to eq(false)
      expect(route.errors[:waypoints]).to include("a minumum of 2 waypoints must be provided to create a route")
    end
  end
end
