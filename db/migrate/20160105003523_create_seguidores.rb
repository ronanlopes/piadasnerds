class CreateSeguidores < ActiveRecord::Migration
  def change
    create_table :seguidores do |t|
      t.string :screen_name
      t.string :name
      t.boolean :verified
      t.boolean :following
      t.integer :followers_count
      t.integer :friends_count
      t.integer :statuses_count
      t.integer :favourites_count
      t.integer :listed_count
      t.string :description
      t.string :location
      t.string :lang
      t.string :url
      t.string :profile_image_url
      t.string :profile_background_image_url

      t.timestamps null: false
    end
  end
end
