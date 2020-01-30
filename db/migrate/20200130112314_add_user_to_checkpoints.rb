class AddUserToCheckpoints < ActiveRecord::Migration[6.0]
  def change
    add_reference :checkpoints, :user, null: false, foreign_key: true
  end
end
