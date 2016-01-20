class CreateCalendarios < ActiveRecord::Migration
  def change
    create_table :calendarios do |t|
      t.string :evento
      t.date :data_inicio
      t.date :data_fim

      t.timestamps null: false
    end
  end
end
