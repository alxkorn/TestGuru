class AddCorrectQuestionsToPassedTests < ActiveRecord::Migration[6.0]
  def change
    add_column :passed_tests, :correct_questions, :integer
  end
end
