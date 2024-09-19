require 'rails_helper'

RSpec.describe Route, type: :model do
  let!(:route) do
    Route.new(
      title: 'TestRoute',
      videos_url: 'www.youtube.com',
      description: 'This is a test route',
      prefecture: 'Hokkaido',
      waypoints: [
        ["140.93342678338806", "42.79543274892502"],
        ["141.09836986142776", "42.86675427633369"],
        ["141.1490391486532", "42.95572467766607"]
      ],
      user_id: 1
    )
  end

  context 'route with title' do
    it 'returns a valid route' do
      expect(route.title).to eq('TestRoute')
    end
  end

  context 'route without title' do
    before { route.title = nil }
    it 'returns invalid route' do
      expect(route.valid?).to eq(false)
    end
  end

  # context 'route with a user id' do
  #   it 'returns a valid route' do
  #     expect(route.valid?).to eq(true)
  #   end
  # end

  context 'route without a user id' do
    before { route.user_id = nil }
    it 'returns invalid route' do
      expect(route.valid?).to eq(false)
    end
  end

  describe '#minimum_waypoints' do
    before { route.waypoints = ["140.93342678338806", "42.79543274892502"] }
    it 'a route is invalid when only one waypoint is provided' do
      expect(route.valid?).to eq(false)
    end
  end
end
