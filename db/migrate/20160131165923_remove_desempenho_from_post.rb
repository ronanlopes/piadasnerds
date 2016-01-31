class RemoveDesempenhoFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :desempenho, :string
  end
end
