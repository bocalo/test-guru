# == Schema Information
#
# Table name: tests
#
#  id          :integer          not null, primary key
#  level       :integer          default(1), not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :integer
#  category_id :integer
#
# Indexes
#
#  index_tests_on_author_id    (author_id)
#  index_tests_on_category_id  (category_id)
#
# Foreign Keys
#
#  author_id    (author_id => users.id)
#  category_id  (category_id => categories.id)
#
class Test < ApplicationRecord
  has_many :questions
  has_many :test_users
  has_many :users, through: :test_users
  belongs_to :category
  belongs_to :author, class_name: "User", foreign_key: 'author_id'

  def self.sort_tests_by_title(category_title)
    Test.joins('JOIN categories ON categories.id = tests.category_id')
       .where('categories.title = ?', category_title)
       .order('tests.title DESC')
       .pluck('tests.title')
  end
end

