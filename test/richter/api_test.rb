require File.join(File.expand_path(File.dirname(__FILE__)), 'test_helper')
require File.join(File.expand_path(File.dirname(__FILE__)), '..', '..', 'lib', 'richter', 'api')

require 'rack/test'


describe Richter::API do
  include Rack::Test::Methods

  def app
    Richter::API.new
  end

  describe 'GET /' do
    it 'returns a welcome message' do
      get '/'
      JSON.parse(last_response.body).must_equal({"welcome" => "To Richter"})
    end

    it 'returns http status 200' do
      get '/'
      last_response.status.must_equal 200
    end
  end
end