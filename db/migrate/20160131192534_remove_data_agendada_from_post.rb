class RemoveDataAgendadaFromPost < ActiveRecord::Migration
  def change
    remove_column :posts, :data_agendada, :datetime
  end
end
