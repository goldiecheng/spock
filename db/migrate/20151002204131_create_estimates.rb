class CreateEstimates < ActiveRecord::Migration
  def change
    create_table :estimates do |t|
      t.integer :days
      t.references :epic, null: false
      t.references :skill, null: false
      
      t.timestamps null: false
    end
  end
end
