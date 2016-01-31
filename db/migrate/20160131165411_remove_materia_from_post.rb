class RemoveMateriaFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :materia, :string
  end
end
