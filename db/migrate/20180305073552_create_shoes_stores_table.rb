class CreateShoesStoresTable < ActiveRecord::Migration[5.1]
  def change
    create_table(:shoes_stores) do |t|
      t.column(:shoe_id, :int)
      t.column(:store_id, :int)
    end
  end
end
