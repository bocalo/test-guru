class CreateBadges < ActiveRecord::Migration[6.0]
  def change
    create_table :badges do |t|
      t.string :title, null: false
      t.string :image_url, null: false
      t.string :badge_type, null: false
      t.string :badge_value, null: false

      t.timestamps
    end
  end
end
