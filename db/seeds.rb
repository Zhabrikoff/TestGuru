# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([
                      { name: 'Yaheni', email: 'yauheni@test.com' },
                      { name: 'Irina', email: 'irina@test.com' }
                    ])

categories = Category.create([
                               { title: 'Ruby' },
                               { title: 'Rails' }
                             ])

tests = Test.create([
                      { title: 'Ruby Basics', level: 0, category_id: categories[0].id },
                      { title: 'Ruby on Rails Basics', level: 1, category_id: categories[1].id },
                      { title: 'Ruby on Rails advanced', level: 2, category_id: categories[1].id }
                    ])

questions = Question.create([
                              { body: 'What is irb?', test_id: tests[0].id },
                              { body: 'How to convert a variable from a number to a string?', test_id: tests[0].id },
                              { body: 'Who created Ruby?', test_id: tests[1].id },
                              { body: 'What is Ruby on Rails?', test_id: tests[1].id }
                            ])

Answer.create([
                { body: 'Interactive Ruby Shell', correct: true, question_id: questions[0].id },
                { body: 'Integrated Routing and Bridging', correct: false, question_id: questions[0].id },
                { body: 'number.to_s', correct: true, question_id: questions[1].id },
                { body: 'number.to_i', correct: false, question_id: questions[1].id },
                { body: 'Yukihiro Matsumoto', correct: true, question_id: questions[2].id },
                { body: 'Linus Benedict Torvalds', correct: false, question_id: questions[2].id },
                { body: 'It is a framework used to create web applications', correct: true,
                  question_id: questions[3].id },
                { body: 'Library for working with time', correct: false, question_id: questions[3].id }
              ])

TestsStatus.create([
                     { status: 'In progress', user_id: users[0].id, test_id: tests[1].id },
                     { status: 'Completed', user_id: users[0].id, test_id: tests[0].id },
                     { status: 'Completed', user_id: users[1].id, test_id: tests[1].id }
                   ])
