class GamesController < ApplicationController

  get '/' do
    api_response = HTTParty.get("http://www.colourlovers.com/api/palettes/random")
    @title = api_response['palettes']['palette']['title']
    @hexs = api_response['palettes']['palette']['colors']['hex']
    erb :'games/select'
  end

end