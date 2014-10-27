class InitialFields < ActiveRecord::Migration
  def change
    create_table :utilities do |t|
      t.integer :user_id
      t.string :name
      t.string :account_number
    end

    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
    add_column :users, :phone_number, :string

    create_table :payment_methods do |t|
      t.integer :user_id
      t.string :type
      t.string :carholders_name
      t.string :cc_number
      t.string :cc_security_code
      t.string :experation_date
    end
  end
end
