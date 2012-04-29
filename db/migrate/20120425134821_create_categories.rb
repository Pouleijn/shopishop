class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :position
      t.string  :name,      limit: 20
      t.boolean :published, default: false

      t.timestamps
    end

    add_index :categories, :name, unique: true
  end
end
