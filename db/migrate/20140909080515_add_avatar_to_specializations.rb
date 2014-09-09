class AddAvatarToSpecializations < ActiveRecord::Migration
  def change
    add_column :specializations, :avatar, :string
  end
end
