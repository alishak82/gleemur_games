class TicTacToeController < ApplicationController

  post '/' do
    game = TicTacToe.create
  end
end