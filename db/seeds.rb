# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{ role: 'user', name: 'Alex', email: 'alexk@gmail.com', password: 'nmgB7yu' },
                     { role: 'user', name: 'Olivia', email: 'oliviap@gmail.com', password: 'vuyieY89' },
                     { role: 'creator', name: 'Victoria', email: 'victoriark@gmail.com', password: 'vniuawr00i' },
                     { role: 'creator', name: 'John', email: 'johnb@gmail.com', password: 'fbiTiY8' }])

categories = Category.create([{ title: 'Ruby Language' },
                              { title: 'Ruby on Rails' }])

tests = Test.create([{ user_id: User.find_by(name: 'Victoria').id, category_id: Category.find_by(title: 'Ruby Language').id, title: 'Ruby basics', level: 0 },
                     { user_id: User.find_by(name: 'John').id, category_id: Category.find_by(title: 'Ruby on Rails').id, title: 'Rails basics', level: 1 }])

ruby_id = Test.find_by(title: 'Ruby basics').id
rails_id = Test.find_by(title: 'Rails basics').id
texts = ['Ruby is what kind of programming language?',
         'Variables that start with two \'@\' symbols are what kind of variables in Ruby?',
         'Ruby is an object-oriented general-purpose programming language.',
         'Which of the following methods outputs a text field?',
         'Which of the following associations exists when a single object can be a member of many other objects?',
         'Rails Active Record follows which standard ORM model?']
questions = Question.create([{ test_id: ruby_id, text: texts[0] },
                             { test_id: ruby_id, text: texts[1] },
                             { test_id: ruby_id, text: texts[2] },
                             { test_id: rails_id, text: texts[3] },
                             { test_id: rails_id, text: texts[4] },
                             { test_id: rails_id, text: texts[5] }])

answers = Answer.create([{ question_id: Question.find_by(text: texts[0]).id, text: 'Strongly typed/Statically typed', correct: true },
                         { question_id: Question.find_by(text: texts[0]).id, text: 'Weakly typed/Statically typed', correct: false },
                         { question_id: Question.find_by(text: texts[1]).id, text: 'Class variable', correct: true },
                         { question_id: Question.find_by(text: texts[1]).id, text: 'Instance variable', correct: false },
                         { question_id: Question.find_by(text: texts[2]).id, text: 'True', correct: true },
                         { question_id: Question.find_by(text: texts[2]).id, text: 'False', correct: false },
                         { question_id: Question.find_by(text: texts[3]).id, text: 'text_field', correct: true },
                         { question_id: Question.find_by(text: texts[3]).id, text: 'form_tag', correct: false },
                         { question_id: Question.find_by(text: texts[4]).id, text: 'one-to-many', correct: true },
                         { question_id: Question.find_by(text: texts[4]).id, text: 'one-to-one', correct: false },
                         { question_id: Question.find_by(text: texts[5]).id, text: 'Tables map to classes', correct: true },
                         { question_id: Question.find_by(text: texts[5]).id, text: 'Tables map to objects', correct: false }])

passed_tests = PassedTest.create([{ test_id: ruby_id, user_id: User.find_by(name: 'Alex').id },
                                  { test_id: rails_id, user_id: User.find_by(name: 'Alex').id },
                                  { test_id: ruby_id, user_id: User.find_by(name: 'Olivia').id }])
