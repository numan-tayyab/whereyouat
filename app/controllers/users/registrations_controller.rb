class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :html, :json

  def create
    if request.format(request) == "application/json"
      params.require(:user).permit!
      resource = User.new(person_params)
      if resource.save!
        render :json => {:success => "true", :message => "User created"}
      else
        render :json => {:success => "false", :message => resource.errors.full_messages.join()}
      end

    else
      super
    end
  end

  private

  def person_params
    params.require(:user).permit(:email, :password)
  end

end