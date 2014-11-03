class ChangeExpDateToDate < ActiveRecord::Migration
  def change
    change_column :users, :experation_date, :date
  end
end
