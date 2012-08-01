class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :position
      t.string  :name,          null: false, limit: 20
      t.boolean :published,     default: false
      t.integer :labels_count,  default: 0

      t.timestamps
    end

    add_index :categories, :name, unique: true
  end
end
