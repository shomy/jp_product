class CreateAreas < ActiveRecord::Migration[5.2]
  def change
    create_table :areas do |t|
      t.string :area1
      t.string :area2
      t.string :area3
      t.string :area4
      t.string :area5
      t.string :area6
      t.string :area7
      t.string :area8
      t.string :area9
      t.string :area10
      t.references :ginfo, foreign_key: true

      t.timestamps
    end
  end
end
