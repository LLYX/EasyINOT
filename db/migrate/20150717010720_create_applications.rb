class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.string :english_name
      t.string :french_name
      t.boolean :critical

      t.timestamps null: true
    end
  end
end
