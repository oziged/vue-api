class AddCheckpointsToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_reference :checkpoints, :place, null: false, foreign_key: true
  end
end
