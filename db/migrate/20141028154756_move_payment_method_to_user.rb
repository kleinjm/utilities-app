class MovePaymentMethodToUser < ActiveRecord::Migration
  def change
    drop_table :payment_methods

    add_column :users, :payment_type, :string
    add_column :users, :carholders_name, :string
    add_column :users, :cc_number, :string
    add_column :users, :cc_security_code, :string
    add_column :users, :experation_date, :string
  end
end
