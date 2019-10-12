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
| Сущность    | Атрибуты                               |
| ----------- | -------------------------------------- |
| user        | id, role, name, email, password        |
| test        | id, user_id, category_id, title, level |
| question    | id, test_id, text                      |
| answer      | id, question_id, correct, text         |
| passed_test | id, test_id, user_id                   |
| category    | id, title                              |

