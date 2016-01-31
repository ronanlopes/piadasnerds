class AddMateriaIdToPost < ActiveRecord::Migration
  def change
    add_column :posts, :materia_id, :integer
  end
end
