class AddSortToEpic < ActiveRecord::Migration
  def change
    add_column :epics, :sort, :integer, null: false, default: 1
  end
end
