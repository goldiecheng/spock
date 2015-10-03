class CreateEpics < ActiveRecord::Migration
  def change
    create_table :epics do |t|
      t.string :name

      t.timestamps null: false
    end

    create_table :epics_members, id: false do |t|
      t.belongs_to :epic, index: true
      t.belongs_to :member, index: true
    end
  end
end
