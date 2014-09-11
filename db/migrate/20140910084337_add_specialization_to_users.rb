class AddSpecializationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :specialization_id, :integer
  end
end
