class CreateLabelizations < ActiveRecord::Migration
  def change
    create_table :labelizations do |t|
      t.belongs_to :category
      t.belongs_to :label
    end

    add_index :labelizations, [:category_id, :label_id], :unique => true
  end
end
