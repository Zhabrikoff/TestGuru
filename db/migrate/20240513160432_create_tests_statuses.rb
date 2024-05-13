class CreateTestsStatuses < ActiveRecord::Migration[6.1]
  def change
    create_table :tests_statuses do |t|
      t.string :status, null: false
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
