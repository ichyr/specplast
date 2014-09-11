class CreateVmilists < ActiveRecord::Migration
  def change
    create_table :vmilists do |t|
      t.string :name
      t.text :child_info
      t.text :instructor_info
      t.integer :specialization_id

      t.timestamps
    end
  end
end
