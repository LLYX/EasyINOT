class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :english_name
      t.string :french_name

      t.timestamps null: true
    end
  end
end
