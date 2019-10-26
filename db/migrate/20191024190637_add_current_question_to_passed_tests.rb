class AddCurrentQuestionToPassedTests < ActiveRecord::Migration[6.0]
  def change
    add_reference :passed_tests, :current_question, foreign_key: {to_table: :questions}
  end
end
