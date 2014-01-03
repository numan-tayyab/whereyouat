class Users::SessionsController < Devise::SessionsController

#  respond_to :html, :json
#
#  def new
#    self.resource = resource_class.new(sign_in_params)
#    clean_up_passwords(resource)
#    resource.role = Role.find_by_name(params[:role])
#    resource.role.blank? ? (redirect_to "/") : (respond_with(resource, serialize_options(resource)))
#  end
#
#  def create
#    request.format(request) == "application/json" ? create_json : create_html
#  end
#
#  def sign_in_and_redirect(resource_or_scope, resource=nil)
#    scope = Devise::Mapping.find_scope!(resource_or_scope)
#    resource ||= resource_or_scope
#    sign_in(scope, resource) unless warden.user(scope) == resource
#    unless request.format(request) == "application/json"
#      respond_with resource, :location => after_sign_in_path_for(resource)
#    else
#      return render :json => {:success => "true", :user => after_signin_data(resource)}
#    end
#  end
#
#  def failure
#    return render :json => {:success => "false", :errors => "Login failed."}
#  end
#
#  def create_json
#    params[:user][:password] = AESCrypt.decrypt(params[:user][:password], "CuRbP455") unless params["service_value"] == "android"
#    resource = warden.authenticate!(:scope => resource_name, :recall => "users/sessions#failure")
#    return sign_in_and_redirect(resource_name, resource)
#  end
#
#  def
#  create_html
#    resource = warden.authenticate!(auth_options)
#    set_flash_message(:notice, :signed_in) if is_navigational_format?
#    sign_in(resource_name, resource)
#    respond_with resource, :location => after_sign_in_path_for(resource)
#
#  end
#
#  def after_signin_data(user)
#    days = []
#    request_time_zone = params[:time_zone].present? ? params[:time_zone] : "Pacific Time (US & Canada)"
#    diff = Time.now.hour -  Time.now.in_time_zone(request_time_zone).hour
#    Date::DAYNAMES.each { |x| days << [x] }
#    flag = Promotion.select { |promo| promo.user_id == user.id and promo.shared }
#    @customer = BraintreeRails::Customer.find(user.customer_id)
#    @locations = Location.includes(:calendar_events => [:rate]).where(:is_deleted => false).near("#{params[:lat].to_f} , #{params[:long].to_f}", 40)
#    #@locations = Location.where(:is_deleted => false).near("#{params[:lat].to_f} , #{params[:long].to_f}", 40)
#    loc_arr = []
#    unless @locations.blank?
#      @locations.each do |location|
#        pri = 0
#        if location.calendar_events.present?
#          location.calendar_events.each do |ce|
#            start_time = Time.parse(ce.start_at.iso8601).strftime("%H:%M:%S")
#            end_time = Time.parse(ce.end_at.iso8601).strftime("%H:%M:%S") if ce.end_at
#            unless ce.rate.blank?
#              date_start = [WebServicesController.new.date_of_next(days[Time.parse(ce.start_at.iso8601).wday].to_s), start_time].join(" ")
#              date_end = [WebServicesController.new.date_of_next(days[Time.parse(ce.end_at.iso8601).wday].to_s), end_time].join(" ")
#              pri = ce.rate.price if  ce.all_day ? Date.today.between?(Date.parse(date_start), Date.parse(date_end)) : (Time.now - diff.hours).between?(date_start, date_end)
#            end
#          end
#        end
#        loc_arr << {:price => pri, :id => location.id, :name => location.name,
#                    :address => location.address, :code => location.code,
#                    :latitude => location.latitude, :longitude => location.longitude}
#      end
#    end
#    {:email => user.email, :code => user.code, :customer_id => user.customer_id, :first_name => @customer.first_name, :last_name => @customer.last_name,
#     :credit_cards => (@customer.credit_cards.map { |f| {:id => f.id, :number => f.masked_number, :commercial => (f.commercial ? "Business" : "Personal"),
#                                                         :expiry_date => f.expiration_date,
#                                                         :postal_code => (f.billing_address.present? ? f.billing_address.postal_code : ""), :card_type => f.card_type} }
#     ), :locations => loc_arr, :is_shared => flag.present? ? "true" : "false"}
#  end
#
#end
#
#class User::ParameterSanitizer < Devise::ParameterSanitizer
#  def sign_in
#    default_params.permit(:username, :email)
#  end
end