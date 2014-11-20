class HomeController < ApplicationController
  def index
    @utilities = current_user.utilities
  end

  def pay_utility
    @utility = Utility.find(params[:id])
    @utility.update_attribute(:paid, params[:paid])

    respond_to do |format|
      if params[:paid] == "true"
        format.html { redirect_to root_path, notice: "Your #{@utility.name} bill of $52.37 has been successfully paid!" }
      else
        format.html { redirect_to utilities_path, notice: 'For Demo: You have reset the payment for your bill' }
      end
    end
  end
end
