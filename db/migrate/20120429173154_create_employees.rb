class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender, limit: 10
      t.date :birthday
      t.text :bio
      t.string :role, limit: 10, default: "seller"
      t.references :user

      t.timestamps
    end
    add_index :employees, :user_id
  end
end
