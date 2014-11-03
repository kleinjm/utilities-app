class AddDefaultToPaid < ActiveRecord::Migration
  def change
    change_column :utilities, :paid, :boolean, :default => false
  end
end
