class HomeController < ApplicationController

  def index
   @users = User.includes(:profile).where("'is_super_admin' != 'true'").all
  end

end
