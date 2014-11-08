class HangmanGameController < ApplicationController


  get '/' do
    api_response = HTTParty.get("http://www.colourlovers.com/api/palettes/random")
    @title = api_response['palettes']['palette']['title']
    @hexs = api_response['palettes']['palette']['colors']['hex']
    # @word = 'lemur'
    erb :'hangman/index'
  end


  patch '/:id' do
    content_type :json

    game = HangmanGame.find(params[:id])
    guess = params[:guess].downcase
    game.guess_letter(guess);


    {
      id: game.id,
      game_state: game.game_state,
      bad_guesses: game.bad_guesses,
      complete: game.game_state == game.word
    }.to_json
  end


  # hangman_game_controller
  post '/' do
    content_type :json

    word = File.read('./lib/words.txt').split("\n").sample
    game_state = word.gsub(/\w/i, '_')
    game = HangmanGame.create({word: word, game_state: game_state})

    {
      id: game.id,
      game_state: game.game_state
    }.to_json

  end
end

  # get '/api/hangman' do
  #   content_type :json
  #   letter_guessed_from_client = params[:letterFromClient]
  #   letter_processed_by_server = letter_guessed_from_client.gsub('/\w/', '_')
  # end

