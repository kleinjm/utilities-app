class HomeController < ApplicationController
  def index
    @utilities = current_user.utilities
  end
end
