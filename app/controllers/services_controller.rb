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
      render :json => {:success => "false", :message => "user not found"}
    end
  end

  def respond_to_status
    if params[:status_id].present?
      user = User.find(params[:user_id])
      status = Status.find(params[:status_id])
      user.user_statuses << UserStatus.create!(:user => user, :status => status, :user_response => params[:status])
      render :json => {:success => "true", :message => "status #{params[:status]}d"}
    else
      render :json => {:success => "false", :message => "status not found"}
    end
  end

  def user_check_in
    if params[:lat].present? and params[:long].present?
      user = User.find(params[:user_id])
      status = Status.find(params[:status_id])
      user.user_statuses << UserStatus.create!(:user => user, :status => status, :user_response => params[:status])
      render :json => {:success => "true", :message => "status #{params[:status]}d"}
    else
      render :json => {:success => "false", :message => "status not found"}
    end
  end
end
