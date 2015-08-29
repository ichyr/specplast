class AddStatusToVmilists < ActiveRecord::Migration
  def change
    add_column :vmilists, :status, :integer
  end
end
