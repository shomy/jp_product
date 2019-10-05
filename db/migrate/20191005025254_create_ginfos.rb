class CreateGinfos < ActiveRecord::Migration[5.2]
  def change
    create_table :ginfos do |t|
      t.integer :age
      t.string :sex
      t.string :tel_number
      t.string :face_picture
      t.text :hitokoto_shoukai
      t.text :shoukaibun
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
