class AddPlacesToCandidates < ActiveRecord::Migration[5.0]
  def change
    add_column :candidates, :image, :string
  end
end
