class RemoveDescricaoFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :descricao, :string
  end
end
