class CreateFileObjects < ActiveRecord::Migration[5.2]
  def change
    create_table :file_objects do |t|
      t.belongs_to :build, index: true
      t.timestamps
    end
  end
end
