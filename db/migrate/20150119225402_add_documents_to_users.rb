class AddDocumentsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :documents, :json
  end
end
