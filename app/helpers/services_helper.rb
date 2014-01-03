module ServicesHelper

  def user_profile_data(user)
    {:user_name => user.profile.user_name, :status => user.profile.status, :dob => user.profile.dob.strftime("%m.%d.%Y")}
  end

end
