class CreateSpecdata < ActiveRecord::Migration
  def change
    create_table :specdata do |t|
      t.text :gen_info
      t.text :proby
      t.text :activity
      t.text :provid
      t.integer :specialization_id

      t.timestamps
    end
  end
end
