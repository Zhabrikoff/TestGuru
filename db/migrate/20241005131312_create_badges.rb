class CreateBadges < ActiveRecord::Migration[6.1]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :image, null: false
      t.string :rule_type, null: false
      t.string :rule_value, null: false

      t.timestamps
    end
  end
end
