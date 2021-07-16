# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_many :test_users
  has_many :tests, through: test_users
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  validates :name, presence: true
  validates :email, presence: true

  scope :sort_by_level, -> (level) { where(level: level) }

  def test_by_level(level)
    tests.sort_by_level (level)
  end
end

