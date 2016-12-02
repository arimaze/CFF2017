class AddNbPagesToComics < ActiveRecord::Migration
  def change
    add_column :comics, :NbPages, :integer
  end
end
