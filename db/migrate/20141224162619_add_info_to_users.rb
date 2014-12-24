class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :city, :string
    add_column :users, :region, :string
    add_column :users, :description, :text
  end
end
