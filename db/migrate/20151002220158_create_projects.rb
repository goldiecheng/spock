class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.date :start_date

      t.timestamps null: false
    end

    add_column :epics, :project_id, :integer, null: false, default: 1
  end
end
