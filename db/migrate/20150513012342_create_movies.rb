class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.integer :itunes_id
      t.string :name
      t.string :image_link

      t.timestamps
    end
  end
end
