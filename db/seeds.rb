# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([
  { name: 'Tom', email: 'tom@example.com', first_name: 'Tom', last_name: 'Hanks', password: 'secretus' },
  { name: 'Adamas', email: 'adamas@example.com', first_name: 'Adamas', last_name: 'Monti', password: 'secretus', type: 'Admin' }
  # { name: 'Mikhail', email: 'm52d8c1@gmail.com', first_name: 'Mikhail', last_name: 'Moldavskiy', password: 'Qwerty123', type: 'Admin' },
])

categories = Category.create!([
  { title: 'Frontend' },
  { title: 'Backend' },
  { title: 'Machine Learning' }
])

tests = Test.create!([
  { title: 'HTML', level: 3, category_id: categories[0].id},
  { title: 'CSS', level: 2, category_id: categories[0].id},
  { title: 'JS', level: 1, category_id: categories[1].id},
  { title: 'PHP', level: 1, category_id: categories[1].id},
  { title: 'Java', level: 3, category_id: categories[1].id}
])

questions = Question.create!([
  { body: 'What do you know about html forms?', test_id: tests[0].id },
  { body: 'What can you say about margins?', test_id: tests[1].id },
  { body: 'What do you think about php cookies?', test_id: tests[4].id },
  { body: 'Is it true JS - the most popular language?', test_id: tests[2].id },
  { body: 'What java string methods do you know?', test_id: tests[3].id },
])

answers = Answer.create!([
  { correct: true, body: 'An HTML form is used to collect user input', question_id: questions[0].id},
  { correct: true, body: 'Margins are used to create space around elements, outside of any defined borders.', question_id: questions[1].id},
  { correct: true, body: "A cookie is a small file that the server embeds on the user's computer.", question_id: questions[4].id},
  { correct: true, body: 'This is a difficult question.', question_id: questions[2].id},
  { correct: true, body: 'I know methods as length(), concat() and charAt().', question_id: questions[3].id }
])

Badge.create([
  {
    title: 'all_tests_at_category Frontend',
    badge_type: 'all_tests_at_category',
    badge_value: categories[0].title,
    image_url: 'star'
  },
  {
    title: 'passed_test_at_first_attempt',
    badge_type: 'passed_test_at_first_attempt',
    badge_value: 'passed_test_at_first_attempt',
    image_url: 'star-fill'
  },
  {
    title: 'all_tests_at_level 1',
    badge_type: 'all_tests_at_level',
    badge_value: 1,
    image_url: 'rocket'
  }
])
