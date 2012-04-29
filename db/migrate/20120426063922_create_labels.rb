class CreateLabels < ActiveRecord::Migration
  def change
    create_table :labels do |t|
      t.string :name, limit: 20

      t.timestamps
    end
    add_index :labels, :name, unique: true
  end
end
