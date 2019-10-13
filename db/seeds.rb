# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create!([{ role: 'user', name: 'Alex', email: 'alexk@gmail.com', password: 'nmgB7yu' },
                      { role: 'user', name: 'Olivia', email: 'oliviap@gmail.com', password: 'vuyieY89' },
                      { role: 'creator', name: 'Victoria', email: 'victoriark@gmail.com', password: 'vniuawr00i' },
                      { role: 'creator', name: 'John', email: 'johnb@gmail.com', password: 'fbiTiY8' }])

categories = Category.create!([{ title: 'Ruby Language' },
                               { title: 'Ruby on Rails' }])

tests = Test.create!([{ author: users[2], category: categories[0], title: 'Ruby basics', level: 0 },
                      { author: users[3], category: categories[1], title: 'Rails basics',level: 1 }])

texts = ['Ruby is what kind of programming language?',
         'Variables that start with two \'@\' symbols are what kind of variables in Ruby?',
         'Ruby is an object-oriented general-purpose programming language.',
         'Which of the following methods outputs a text field?',
         'Which of the following associations exists when a single object can be a member of many other objects?',
         'Rails Active Record follows which standard ORM model?']
questions = Question.create!([{ test: tests[0], text: texts[0] },
                              { test: tests[0], text: texts[1] },
                              { test: tests[0], text: texts[2] },
                              { test: tests[1], text: texts[3] },
                              { test: tests[1], text: texts[4] },
                              { test: tests[1], text: texts[5] }])

answers = Answer.create!([{ question: questions[0], text: 'Strongly typed/Statically typed', correct: true },
                          { question: questions[0], text: 'Weakly typed/Statically typed', correct: false },
                          { question: questions[1], text: 'Class variable', correct: true },
                          { question: questions[1], text: 'Instance variable', correct: false },
                          { question: questions[2], text: 'True', correct: true },
                          { question: questions[2], text: 'False', correct: false },
                          { question: questions[3], text: 'text_field', correct: true },
                          { question: questions[3], text: 'form_tag', correct: false },
                          { question: questions[4], text: 'one-to-many', correct: true },
                          { question: questions[4], text: 'one-to-one', correct: false },
                          { question: questions[5], text: 'Tables map to classes', correct: true },
                          { question: questions[5], text: 'Tables map to objects', correct: false }])

passed_tests = PassedTest.create!([{ test: tests[0], user: users[0], progress: 50},
                                   { test: tests[1], user: users[0], progress: 20},
                                   { test: tests[0], user: users[1], progress: 100}])
