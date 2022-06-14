class ChengeColumnFromUser < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :gender, true
    change_column_null :users, :birthday, true
  end
end
