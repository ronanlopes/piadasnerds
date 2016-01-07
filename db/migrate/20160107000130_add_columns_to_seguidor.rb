class AddColumnsToSeguidor < ActiveRecord::Migration
  def change
    add_column :seguidores, :lat, :float
    add_column :seguidores, :long, :float
  end
end
