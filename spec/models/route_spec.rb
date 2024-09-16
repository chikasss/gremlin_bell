require 'rails_helper'
route = Route.new(
  title: 'TestRoute',
  description: 'This is a test route',
  prefecture: 'Hokkaido',
  waypoints: [
    ["140.93342678338806", "42.79543274892502"],
    ["141.09836986142776", "42.86675427633369"],
    ["141.1490391486532", "42.95572467766607"]
  ]
)

RSpec.describe Route, type: :model do
  it 'route has a title' do
    expect(route.title).to eq('TestRoute')
  end
end
