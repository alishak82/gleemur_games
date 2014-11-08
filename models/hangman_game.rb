class HangmanGame < ActiveRecord::Base

  belongs_to :user

  # def guess_letter(letter)
  #   index = self.word.index(letter)
  #   if index                                      # What if there is the same letter more than once?
  #     state = self.game_state.dup
  #     state[index] = letter
  #     self.update({game_state: state})
  #   else
  #     bad = self.bad_guesses
  #     bad+=letter
  #     self.update({bad_guesses: bad})
  #   end
  #   self.game_state
  # end

  def guess_letter(letter)
    if self.word.include?(letter)
      letter_locations = []
      self.word.chars.each_with_index do |word_letter, index|
        if word_letter == letter
          letter_locations << index
        end
      end
      state = self.game_state.dup
      letter_locations.each do |letter_index|
        state[letter_index] = letter
      end
      self.update({game_state: state})
    else
      bad = self.bad_guesses
      bad+=letter
      self.update({bad_guesses: bad})
    end
    self.game_state
  end

end





# Game is already stared

#   These are toonify:
  # patch '/:id'   make a letter guess... passed via ajax
  # We are playing a game...  A html page... every ajax request... updates game state <h3>

# game = HangmanGame.find(params[:id])
# game.guess_letter(params[:guess])
# game.save

# {
#   game_state: game.game_state,
#   bad_guesses: game.bad_guesses,
# }.to_json


# Simply fire a GET request to http://randomword.setgetgo.com/get.php

# Example Usage with Javascript/JQuery

#     function RandomWord() {
#         var requestStr = "http://randomword.setgetgo.com/get.php";

#         $.ajax({
#             type: "GET",
#             url: requestStr,
#             dataType: "jsonp",
#             jsonpCallback: 'RandomWordComplete'
#         });
#     }

#     function RandomWordComplete(data) {
#         alert(data.Word);
#     }


    # def set_word
  #   self.word (csv).sample

  #   def wrong_guesses

  #   def guess_a_letter(letter)
  #     if self.word.include? letter
