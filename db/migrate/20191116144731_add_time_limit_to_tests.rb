class AddTimeLimitToTests < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :time_limit, :integer, null: true
  end
end
