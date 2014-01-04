class AddColumnEmployeeInfoToUser < ActiveRecord::Migration
  def change
    add_column :users, :employee_info, :text
  end
end
