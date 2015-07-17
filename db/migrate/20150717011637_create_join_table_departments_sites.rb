class CreateJoinTableDepartmentsSites < ActiveRecord::Migration
  def change
    create_table :departments_sites, id: false do |t|
      t.belongs_to :department, index: true
      t.belongs_to :site, index: true
    end
  end
end
