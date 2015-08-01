class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :english_name
      t.string :french_name

      t.timestamps null: true
    end
  end
end
