class AddFileToSpecdatum < ActiveRecord::Migration
  def change
    add_column :specdata, :pologennya, :string
  end
end
