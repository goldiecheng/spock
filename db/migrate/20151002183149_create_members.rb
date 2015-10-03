class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name, null: false 
      t.references :skill, null: false

      t.timestamps null: false
    end
  end
end
