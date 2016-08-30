class CreateCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates do |t|
      t.text :name
      t.text :description
      t.float :latitude
      t.float :longitude
      t.text :comment
      t.timestamps
    end
  end
end
