class DropFrienshipTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :friendships
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
