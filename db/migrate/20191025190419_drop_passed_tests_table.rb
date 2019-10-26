class DropPassedTestsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :passed_tests do |t|
      t.integer "test_id", null: false
      t.integer "user_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.integer "progress", default: 0
      t.integer "correct_questions", default: 0
      t.integer "current_question_id"
      t.index ["current_question_id"], name: "index_passed_tests_on_current_question_id"
      t.index ["test_id"], name: "index_passed_tests_on_test_id"
      t.index ["user_id"], name: "index_passed_tests_on_user_id"
      t.foreign_key "questions", column: "current_question_id"
      t.foreign_key "tests"
      t.foreign_key "users"
    end
  end
end
