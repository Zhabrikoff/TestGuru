class AddReadyStatusToTests < ActiveRecord::Migration[6.1]
  def change
    add_column :tests, :status, :boolean, default: false
  end
end
