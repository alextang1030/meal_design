class CreateFavLists < ActiveRecord::Migration[5.2]
  def change
    create_table :fav_lists do |t|

      t.timestamps
    end
  end
end
