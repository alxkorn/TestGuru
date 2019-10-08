class AddUsersNullConstraints < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:users, :role, false)
    change_column_null(:users, :email, false)
    change_column_null(:users, :password, false)
  end
end
