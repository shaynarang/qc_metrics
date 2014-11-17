class CreateSamples < ActiveRecord::Migration
  def change
    create_table :samples do |t|
      t.string :identifier
      t.integer :total_reads
      t.integer :average_q_score
      t.integer :percent_five_x_coverage
      t.integer :percent_ten_x_coverage
      t.integer :percent_twenty_x_coverage
      t.integer :percent_thirty_x_coverage
      t.belongs_to :project, index: true
    end
  end
end
