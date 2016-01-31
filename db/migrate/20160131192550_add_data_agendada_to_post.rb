class AddDataAgendadaToPost < ActiveRecord::Migration
  def change
    add_column :posts, :data_agendada, :datetime
  end
end
