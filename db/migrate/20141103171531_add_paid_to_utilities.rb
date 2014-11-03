class AddPaidToUtilities < ActiveRecord::Migration
  def change
    add_column :utilities, :paid, :boolean
  end
end
