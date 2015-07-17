class CreateJoinTableApplicationsDepartments < ActiveRecord::Migration
  def change
    create_table :applications_departments, id: false do |t|
      t.belongs_to :application, index: true
      t.belongs_to :department, index: true
    end
  end
end
