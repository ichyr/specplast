class CreateGeneralInfos < ActiveRecord::Migration
  def change
    create_table :general_infos do |t|
      t.text :key
      t.text :value

      t.timestamps
    end
  end
end
