class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text :username, index: true
      t.text :provider, index: true, null: false
      t.text :provider_id, index: true, null: false
      t.text :name
      t.text :location
      t.text :image_url
      t.timestamps
    end
    add_index :users, [:provider, :provider_id], unique: true
  end
end
