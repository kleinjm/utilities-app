class PaymentMethod < ActiveRecord::Base
  attr_accessible :cardholders_name, :cc_number, :cc_security_code, :experation_date, :payment_type, :user_id
  validates :cc_number, presence: true
  validates :cc_security_code, presence: true

  belongs_to :user

  def select_box_display
    "Credit card ending in #{cc_number.last(4)}"
  end

  def obfuscated
    "XXXX-XXXX-XXXX-#{cc_number.last(4)}"
  end
end
