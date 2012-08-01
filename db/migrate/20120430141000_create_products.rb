class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name,               null: false, limit: 20
      t.text :description
      t.decimal :unit_price,        null: false, precision: 8, scale: 2, default: 0
      t.decimal :sales_price,       precision: 8, scale: 2, default: 0
      t.date :published_at,         null: false
      t.date :published_until
      t.datetime :deleted_at
      t.integer :category_id,       null: false
      t.integer :label_id,          null: false

      t.timestamps
    end

    add_index :products, :name, unique: true
    add_index :products, :category_id
    add_index :products, [:category_id, :label_id]
  end
end
