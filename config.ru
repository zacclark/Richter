require './lib/richter/api'

map "/api" do
  run Richter::API.new
end