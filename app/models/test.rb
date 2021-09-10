# == Schema Information
#
# Table name: tests
#
#  id          :bigint           not null, primary key
#  level       :integer          default(1), not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  author_id   :bigint
#  category_id :bigint
#
# Indexes
#
#  index_tests_on_author_id        (author_id)
#  index_tests_on_category_id      (category_id)
#  index_tests_on_title_and_level  (title,level) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#  fk_rails_...  (category_id => categories.id)
#
class Test < ApplicationRecord
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages
  belongs_to :category, optional: true
  belongs_to :author, class_name: "User", foreign_key: 'author_id', optional: true
  
  validates :title, presence: true, uniqueness: true
  validates :level, numericality: { only_integer: true, greater_than: 0 }, uniqueness: { scope: :title } 

  scope :level, -> (level) { where(level: level) }
  scope :easy, -> { level(0..1) }
  scope :middle, -> { level(2..4) }
  scope :hard, -> { level(5..Float::INFINITY) }
  scope :sort_by_category_title, -> (category_title) { joins(:category).where(categories: { title: category_title })}
  
  def self.sort_tests_by_title(category_title)
    Test.sort_by_category_title(category_title).order(title: :desc).pluck(:title)
  end
end

  


