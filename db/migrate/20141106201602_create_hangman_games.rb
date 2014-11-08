class CreateHangmanGames < ActiveRecord::Migration
  def change
    create_table :hangman_games do |t|
      t.references :user
      t.string :word, default: 'lemur'
      t.string :game_state, default: '_____'
      t.string :bad_guesses, default: ''

      t.timestamps
    end
  end
end
