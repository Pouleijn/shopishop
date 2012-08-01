class CreateAssets < ActiveRecord::Migration
  def change
  	create_table :assets do |t|
  	  t.integer :asset_able_id	
  	  t.string :asset_able_type	
      t.attachment :asset
    end

    add_index :assets, [:asset_able_id, :asset_able_type]
  end
end
