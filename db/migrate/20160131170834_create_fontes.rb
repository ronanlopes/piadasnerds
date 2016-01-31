class CreateFontes < ActiveRecord::Migration
  def change
    create_table :fontes do |t|
      t.string :nome
      t.string :url

      t.timestamps null: false
    end
  end
end
