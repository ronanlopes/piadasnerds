class CreateGradeHorarios < ActiveRecord::Migration
  def change
    create_table :grade_horarios do |t|
      t.string :dia
      t.string :hora
      t.string :conteudo

      t.timestamps null: false
    end
  end
end
