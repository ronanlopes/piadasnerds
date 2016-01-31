class AddNewColumnsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :facebook, :boolean
    add_column :posts, :twitter, :boolean
    add_column :posts, :instagram, :boolean
    add_column :posts, :app, :boolean
    add_column :posts, :data_agendada, :datetime
  end
end
