# == Schema Information
#
# Table name: tests
#
#  id          :integer          not null, primary key
#  level       :integer          default(1), not null
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#
# Indexes
#
#  index_tests_on_category_id  (category_id)
#
# Foreign Keys
#
#  category_id  (category_id => categories.id)
#
class Test < ApplicationRecord
  def self.sort_tests_by_title(category_title)
    Test.joins('JOIN categories ON categories.id = tests.category_id')
       .where('categories.title = ?', category_title)
       .order('tests.title DESC')
       .pluck('tests.title')
  end
end

# Создайте метод класса в модели Test, который возвращает отсортированный по убыванию массив названий всех Тестов у которых Категория называется определённым образом (название категории передается в метод в качестве аргумента).

# Test.joins('JOIN categories ON categories.id = tests.category_id')
#        .where('categories.title = ?, category_title)
    #    .order('tests.title DESC')
    #    .pluck('tests.title')

# Test.joins(:categories).where(categories: { title: category_title})
    # .order(title: :desc)
    # .pluck('tests.title')
