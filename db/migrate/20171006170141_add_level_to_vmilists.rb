class AddLevelToVmilists < ActiveRecord::Migration
  def change
    add_column :vmilists, :level, :integer, default: 1
  end
end
