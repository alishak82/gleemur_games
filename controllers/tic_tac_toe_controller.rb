class TicTacToeController < ApplicationController

  # get '/' do
  #   game = TicTacToe.create
  # end

  get '/' do
    api_response = HTTParty.get("http://www.colourlovers.com/api/palettes/random")
    @title = api_response['palettes']['palette']['title']
    @hexs = api_response['palettes']['palette']['colors']['hex']
    erb :'tictactoe/new'
  end
end