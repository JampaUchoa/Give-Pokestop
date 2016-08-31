class AddUsersToCanditates < ActiveRecord::Migration[5.0]
  def change
    add_reference :candidates, :user, index: true
  end
end
