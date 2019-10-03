# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
## Сущности приложения (предварительные)
| Сущность         | Атрибуты                            |
| ---------------- | ----------------------------------- |
| User             | id, role, username, email, password |
| Test             | id, user_id, title                  |
| Question         | id, test_id, text                   |
| Question_answer  | id, question_id,   correct          |
| User_answer      | id, question_id, question_answer_id |
| User_passed_test | id, test_id, user_id                |

