class AddPaymentMethodIdToUtilities < ActiveRecord::Migration
  def change
    add_column :utilities, :payment_method_id, :integer
  end
end
