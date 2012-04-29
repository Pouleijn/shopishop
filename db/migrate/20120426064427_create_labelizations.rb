class CreateLabelizations < ActiveRecord::Migration
  def change
    create_table :labelizations do |t|
      t.belongs_to :category
      t.belongs_to :label
      t.integer :position
      t.boolean :published, :default => false

      t.timestamps
    end

    add_index :labelizations, [:category_id, :label_id], :unique => true
    add_index :labelizations, :position
    add_index :labelizations, :published
  end
end
