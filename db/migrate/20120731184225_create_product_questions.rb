class CreateProductQuestions < ActiveRecord::Migration
  def change
    create_table :product_questions do |t|
      t.integer :product_id,  null: false
      t.string :name,         null: false
      t.string :email,        null: false
      t.text :description

      t.timestamps
    end

    add_index :product_questions, :product_id
  end
end
