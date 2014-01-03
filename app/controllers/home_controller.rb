class HomeController < ApplicationController

  def index
   @users = User.where("'is_super_admin' != 'true'").all
  end

end
