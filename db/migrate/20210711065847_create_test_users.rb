class CreateTestUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :test_users do |t|
      t.references :tests, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
