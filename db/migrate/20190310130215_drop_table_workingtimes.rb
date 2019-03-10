class DropTableWorkingtimes < ActiveRecord::Migration[5.0]
  def change
    drop_table :workingtimes
  end
end
