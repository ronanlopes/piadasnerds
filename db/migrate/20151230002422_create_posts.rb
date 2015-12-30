class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :cod
      t.date :data
      t.string :descricao
      t.string :fonte
      t.string :materia
      t.string :legenda
      t.string :desempenho

      t.timestamps null: false
    end
  end
end
