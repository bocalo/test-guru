class AddForeignKeys < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :category, foreign_key: true
    add_reference :questions, :test, foreign_key: true
    add_reference :answers, :test, foreign_key: true
  end
end
