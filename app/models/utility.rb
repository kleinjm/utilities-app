class Utility < ActiveRecord::Base
  attr_accessible :name, :account_number, :user_id, :payment_method_id

  belongs_to :payment_method

  validates :name, :account_number, presence: true

  def self.has_unpaid_bills(user)
    unpaid_bills = false
    user.utilities.each do |utility|
      unpaid_bills = unpaid_bills || !utility.paid
    end
    unpaid_bills
  end
end