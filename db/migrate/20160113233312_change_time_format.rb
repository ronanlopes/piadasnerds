class ChangeTimeFormat < ActiveRecord::Migration
  def up
    change_column :grade_horarios, :hora, :string
  end

  def down
    change_column :grade_horarios, :hora, :time
  end
end
