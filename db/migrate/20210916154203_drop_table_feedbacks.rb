class DropTableFeedbacks < ActiveRecord::Migration[6.0]
  def change
    drop_table :feedbacks do |t|
      t.string :title, null: false
      t.text :body, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
