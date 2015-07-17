class CreateJoinTableApplicationsGroups < ActiveRecord::Migration
  def change
    create_table :applications_groups, id: false do |t|
      t.belongs_to :application, index: true
      t.belongs_to :group, index: true
    end
  end
end
