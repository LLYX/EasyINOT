class CreateJoinTableGroupsSites < ActiveRecord::Migration
  def change
    create_table :groups_sites, id: false do |t|
      t.belongs_to :group, index: true
      t.belongs_to :site, index: true
    end
  end
end
