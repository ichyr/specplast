class AddStatusToVmilists < ActiveRecord::Migration
  def change
    add_column :vmilists, :status, :boolean, default: false
  end
end
