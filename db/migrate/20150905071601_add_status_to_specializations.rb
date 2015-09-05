class AddStatusToSpecializations < ActiveRecord::Migration
  def change
  	add_column :specializations, :status, :integer, default: 0
  end
end
