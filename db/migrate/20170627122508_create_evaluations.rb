class CreateEvaluations < ActiveRecord::Migration[5.1]
  def change
    create_table :evaluations do |t|
      t.integer :score
      t.text :comment
      t.date :date

      t.timestamps
    end
  end
end
