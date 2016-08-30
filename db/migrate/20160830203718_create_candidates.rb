class CreateCandidates < ActiveRecord::Migration[5.0]
  def change
    create_table :candidates do |t|

      t.timestamps
    end
  end
end
