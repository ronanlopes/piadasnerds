class AddImagemToPost < ActiveRecord::Migration
  def change
    add_column :posts, :imagem, :string
  end
end
