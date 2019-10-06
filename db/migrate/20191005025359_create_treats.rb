class CreateTreats < ActiveRecord::Migration[5.2]
  def change
    create_table :treats do |t|
      t.integer :treat_f
      t.references :ginfo, foreign_key: true

      t.timestamps
    end
  end
end
