class DropTableTestsStatuses < ActiveRecord::Migration[6.1]
  def up
    drop_table :tests_statuses, if_exists: true
  end

  def down; end
end
