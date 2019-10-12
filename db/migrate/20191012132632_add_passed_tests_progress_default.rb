class AddPassedTestsProgressDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:passed_tests, :progress, from: nil, to: 0)
  end
end
