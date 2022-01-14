class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :ratings
      t.integer :durations
      
      t.timestamps
    end
  end
end
