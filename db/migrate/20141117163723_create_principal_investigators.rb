class CreatePrincipalInvestigators < ActiveRecord::Migration
  def change
    create_table :principal_investigators do |t|
      t.string :first_name
      t.string :last_name
    end
  end
end
