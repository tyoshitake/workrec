class CreateWorktimes < ActiveRecord::Migration[5.0]
  def change
    create_table :worktimes do |t|
      t.references :work, foreign_key: true
      t.integer :time_m
      t.datetime :date
      
      t.timestamps
      
      t.index [:work_id, :date], unique: true
    end
  end
end
