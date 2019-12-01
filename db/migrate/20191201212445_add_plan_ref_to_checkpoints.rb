class AddPlanRefToCheckpoints < ActiveRecord::Migration[6.0]
  def change
    add_reference :checkpoints, :plan, null: false, foreign_key: true
  end
end
