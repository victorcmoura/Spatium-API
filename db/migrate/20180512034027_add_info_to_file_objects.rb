class AddInfoToFileObjects < ActiveRecord::Migration[5.2]
  def change
    add_column :file_objects, :file_name, :string
    add_column :file_objects, :file_size, :integer
  end
end
