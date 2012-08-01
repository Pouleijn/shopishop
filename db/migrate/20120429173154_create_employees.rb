class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name, null: false, limit: 30
      t.string :last_name,  null: false, limit: 50
      t.string :gender,     limit: 10
      t.date :birthday
      t.text :bio
      t.string :role,       null: false, limit: 10, default: "seller"
      t.references :user,   null: false

      t.timestamps
    end
    
    add_index :employees, :user_id
  end
end
