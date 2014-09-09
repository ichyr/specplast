class AddFileToSpecdatum < ActiveRecord::Migration
  def change
    add_column :specdata, :file, :string
  end
end
