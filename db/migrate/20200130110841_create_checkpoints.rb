class CreateCheckpoints < ActiveRecord::Migration[6.0]
  def change
    create_table :checkpoints do |t|
      t.string :title
      t.text :description
      t.references :checkpointable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
