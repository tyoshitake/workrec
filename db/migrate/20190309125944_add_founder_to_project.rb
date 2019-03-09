class AddFounderToProject < ActiveRecord::Migration[5.0]
  def change
    add_reference :projects, :founder, foreign_key: { to_table: :users }
  end
end
