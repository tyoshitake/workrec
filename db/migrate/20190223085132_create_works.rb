class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
      
      t.index [:user_id, :project_id], unique: true
    end
  end
end
