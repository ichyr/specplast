class AddEmailToRegistries < ActiveRecord::Migration
  def change
    add_column :registries, :email, :string
  end
end
