class AddAvatarToVmilists < ActiveRecord::Migration
  def change
    add_column :vmilists, :avatar, :string
  end
end
