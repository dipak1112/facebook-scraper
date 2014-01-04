class AddColumnEducationHistoryToUser < ActiveRecord::Migration
  def change
    add_column :users, :education_history, :text
  end
end
