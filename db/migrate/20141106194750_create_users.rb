class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.string :username
      t.string :password_hash, null: false

      t.string :first_name
      t.string :last_name

      t.string :favorite_color
      t.string :animal, default: 'Lemur'

      t.timestamp
    end
  end
end
