class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :unit_price
      t.decimal :sales_price
      t.datetime :published_at
      t.datetime :published_until
      t.datetime :deleted_at
      t.integer :category_id
      t.integer :label_id

      t.timestamps
    end
  end
end
