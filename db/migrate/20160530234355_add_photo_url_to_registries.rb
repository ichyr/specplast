class AddPhotoUrlToRegistries < ActiveRecord::Migration
  def change
  	add_column :registries, :photo_url, :string
  end
end
