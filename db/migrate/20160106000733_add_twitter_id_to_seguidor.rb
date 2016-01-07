class AddTwitterIdToSeguidor < ActiveRecord::Migration
  def change
    add_column :seguidores, :twitter_id, :string
  end
end
