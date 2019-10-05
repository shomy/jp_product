class CreateScenes < ActiveRecord::Migration[5.2]
  def change
    create_table :scenes do |t|
      t.string :scene_picture1
      t.string :scene_picture2
      t.string :scene_picture3
      t.string :scene_picture4
      t.string :scene_picture5
      t.string :scene_picture6
      t.references :ginfo, foreign_key: true

      t.timestamps
    end
  end
end
