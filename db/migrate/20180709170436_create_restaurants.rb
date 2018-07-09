class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string    :name
      t.string    :address
      t.integer   :ratings, default: 0
      t.timestamps # add 2 columns, `created_at` and `updated_at`
    end
  end
end