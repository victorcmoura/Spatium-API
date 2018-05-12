class CreateBuilds < ActiveRecord::Migration[5.2]
  def change
    create_table :builds do |t|
      t.string :description
      t.boolean :is_master
      t.integer :master_tag
      t.integer :dev_tag

      t.timestamps
    end
  end
end
