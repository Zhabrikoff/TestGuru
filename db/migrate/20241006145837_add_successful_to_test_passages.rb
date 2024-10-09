class AddSuccessfulToTestPassages < ActiveRecord::Migration[6.1]
  def change
    add_column :test_passages, :successful, :boolean, null: false, default: false
  end
end
