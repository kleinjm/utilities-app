class HomeController < ApplicationController
  def index
    @utilities = current_user.utilities
  end

  def pay_utility
    @utility = Utility.find(params[:id])

    respond_to do |format|
      if @utility.update_attribute(:paid, true)
        format.html { redirect_to root_path, notice: 'You have successfully paid your bill!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @utility.errors, status: :unprocessable_entity }
      end
    end
  end
end
