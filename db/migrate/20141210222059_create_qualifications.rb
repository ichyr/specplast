class CreateQualifications < ActiveRecord::Migration
  def change
    create_table :qualifications do |t|
      t.integer :user_id
      t.integer :vmilist_id
      t.integer :confirmed

      t.timestamps
    end
  end
end
