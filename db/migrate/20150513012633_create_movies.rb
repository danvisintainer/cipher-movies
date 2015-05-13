class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.integer :itunes_id
      t.string :name
      t.string :image_link
      t.integer :user_id

      t.timestamps
    end
  end
end
