# == Schema Information
#
# Table name: badges
#
#  id          :bigint           not null, primary key
#  badge_type  :string           not null
#  badge_value :string           not null
#  image_url   :string           not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Badge < ApplicationRecord

  RULE_TYPES = %i[all_tests_at_category passed_test_at_first_attempt all_tests_at_level]

  has_many :user_badges, dependent: :destroy
  has_many :users, through: :user_badges
  
  validates :title, presence: true
  validates :badge_type, presence: true
  validates :badge_value, presence: true
  validates :image_url, presence: true

  attr_accessor :types

  def self.badge_types
    @types = RULE_TYPES
  end
end
