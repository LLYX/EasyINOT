class CreatePhrases < ActiveRecord::Migration
  def change
    create_table :phrases do |t|
      t.text :english_phrase
      t.text :french_phrase
      t.string :version

      t.timestamps null: true
    end
  end
end
