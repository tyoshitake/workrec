class CreateWorkingtimes < ActiveRecord::Migration[5.0]
  def change
    create_table :workingtimes do |t|
      t.references :user
      t.references :project
      t.integer :workingtime_m
      t.datetime :date
  
      t.timestamps
    end
  end
end
