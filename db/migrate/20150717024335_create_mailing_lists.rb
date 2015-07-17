class CreateMailingLists < ActiveRecord::Migration
  def change
    create_table :mailing_lists do |t|
      t.string :name
      t.text :emails

      t.timestamps null: false
    end
  end
end
