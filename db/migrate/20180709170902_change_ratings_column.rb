class ChangeRatingsColumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :restaurants, :ratings, :rating
  end
end