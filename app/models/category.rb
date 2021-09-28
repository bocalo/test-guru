# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Category < ApplicationRecord
  has_many :tests, dependent: :destroy

  default_scope { order(title: :asc) }

  validates :title, presence: true
end
