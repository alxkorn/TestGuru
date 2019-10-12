class AddProgressToPassedTests < ActiveRecord::Migration[6.0]
  def change
    add_column :passed_tests, :progress, :integer
  end
end
