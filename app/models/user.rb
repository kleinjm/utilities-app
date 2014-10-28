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
end
