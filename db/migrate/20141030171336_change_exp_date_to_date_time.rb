class ChangeExpDateToDateTime < ActiveRecord::Migration
  def change
    remove_column :users, :experation_date
    add_column :users, :experation_date, :datetime
  end
end
