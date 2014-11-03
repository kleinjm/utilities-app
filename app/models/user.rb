class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :city, :address, :state, :zip, :phone_number
  attr_accessible :payment_type, :carholders_name, :cc_number, :cc_security_code, :experation_date
  # attr_accessible :title, :body

  def utilities
    Utility.where(user_id: self.id)
  end

  def has_payment_method
    !(payment_type.blank? && carholders_name.blank? && cc_number.blank? && cc_security_code.blank? && experation_date.blank?)
  end

  def has_basic_info
    !(name.blank? && city.blank? && address.blank? && state.blank? && zip.blank? && phone_number.blank?)
  end
end
