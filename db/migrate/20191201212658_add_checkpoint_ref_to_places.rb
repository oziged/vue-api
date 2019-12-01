class AddCheckpointRefToPlaces < ActiveRecord::Migration[6.0]
  def change
    add_reference :places, :checkpoint, null: false, foreign_key: true
  end
end
