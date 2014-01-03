class ServicesController < ApplicationController

  skip_before_filter :authenticate_user!
  include ServicesHelper

  def get_users_in_locality
    if params[:lat] and params[:long]
      users =[]; Location.near([params[:lat], params[:long]], 40).select { |location| users << location.users.select { |user| user.is_active == true } }
      render :json => {:success => "true", :users => users}
    else
      render :json => {:success => "false", :message => "no location found"}
    end
  end

  def view_user_profile
    if params[:user_id].present?
      user= User.find(params[:user_id])
      render :json => {:success => "true", :user => user_profile_data(user)}
    else
    end
  end
end
