# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
  has_many :test_users
  has_many :tests, through: test_users
  has_many :created_tests, class_name: 'Test'

  def test_by_level(level)
    Test.joins('JOIN test_users ON test_users.test_id = tests.id')
        .where(test_users: { user_id: id})
        .where(level: level)
  end
end



# Создайте инстанс-метод в модели User, который принимает в качестве аргумента значение уровня сложности и возвращает список всех Тестов, которые проходит или когда-либо проходил Пользователь на этом уровне сложности

