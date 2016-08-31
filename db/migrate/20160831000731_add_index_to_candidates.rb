class AddIndexToCandidates < ActiveRecord::Migration[5.0]
  def change
    add_index :candidates, :longitude
    add_index :candidates, :latitude
  end
end
