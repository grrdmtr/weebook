class DropFeedsTable < ActiveRecord::Migration[7.0]
  def up
    drop_table :feeds
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
