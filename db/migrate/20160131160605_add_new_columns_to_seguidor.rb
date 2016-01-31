class AddNewColumnsToSeguidor < ActiveRecord::Migration
  def change
    add_column :seguidores, :ativo, :boolean
    add_column :seguidores, :data_unfollow, :date
  end
end
