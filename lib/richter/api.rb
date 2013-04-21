require 'sinatra/base'

module Richter
  class API < Sinatra::Base
    get '/' do
      {welcome: "To Richter"}.to_json
    end
  end
end