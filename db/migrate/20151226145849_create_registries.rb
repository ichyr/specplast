class CreateRegistries < ActiveRecord::Migration
  def change
    create_table :registries do |t|
      t.string :name
      t.string :surname
      t.date :dob
      t.boolean :sex
      t.integer :rank
      t.string :troop
      t.string :group
      t.string :city
      t.integer :region
      t.integer :vmilist_id
      t.date :achievement_date
      t.string :place
      t.string :activity
      t.integer :instruktor_id
      t.text :comment

      t.timestamps null: false
    end
  end
end
