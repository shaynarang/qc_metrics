class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :number
      t.belongs_to :principal_investigator, index: true
    end
  end
end
