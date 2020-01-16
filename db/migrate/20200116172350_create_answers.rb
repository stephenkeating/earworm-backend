class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.references :game, null: false, foreign_key: true
      t.references :track, null: false, foreign_key: true
      t.string :outcome

      t.timestamps
    end
  end
end
