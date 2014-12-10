class CreateQualifications < ActiveRecord::Migration
  def change
    create_table :qualifications do |t|
      t.integer :user_id
      t.integer :vmilist_id
      t.boolean :confirmed

      t.timestamps
    end
  end
end
