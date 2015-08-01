class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :site_code
      t.string :english_name
      t.string :french_name
      t.boolean :designated

      t.timestamps null: true
    end
  end
end
