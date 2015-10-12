class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :name, null: false, default: ""
      t.belongs_to :skill, null: false, default: 0

      t.timestamps null: false
    end

    add_index :members, :name, :unique => true
    add_foreign_key :members, :skills, on_delete: :nullify
  end
end
