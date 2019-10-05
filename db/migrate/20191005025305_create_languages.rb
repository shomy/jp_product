class CreateLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :languages do |t|
      t.string :japanese
      t.string :integer
      t.string :engilsh
      t.string :integer
      t.string :Chinese
      t.string :integer
      t.integer :Spanish
      t.text :sonota_language

      t.timestamps
    end
  end
end
