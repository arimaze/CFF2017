class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.string :content_type
      t.string :filename
      t.binary :binary_data

      t.timestamps null: false
    end
  end
end
