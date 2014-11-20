class CreatePaymentMethods < ActiveRecord::Migration
  def change
    remove_column :users, :payment_type
    remove_column :users, :carholders_name
    remove_column :users, :cc_number
    remove_column :users, :cc_security_code
    remove_column :users, :experation_date

    create_table :payment_methods do |t|
      t.string :payment_type
      t.string :cardholders_name
      t.string :cc_number
      t.string :cc_security_code
      t.date :experation_date

      t.timestamps
    end
  end
end
