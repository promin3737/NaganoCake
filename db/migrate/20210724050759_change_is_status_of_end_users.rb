class ChangeIsStatusOfEndUsers < ActiveRecord::Migration[5.2]
  def change
    change_column_default :end_users, :is_status, from: false, to: true
  end
end
