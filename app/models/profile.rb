class Profile < ActiveRecord::Base

  belongs_to :user
  has_attached_file :picture, :url => "/system/:attachment/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/system/:attachment/:id/:style/:basename.:extension",
                    :styles => lambda { |a| a.instance.images_styles? ? {:medium => "300x300>", :thumb => "100x100>"} : {} }
  #has_attached_file :picture, :url => "/system/:attachment/:id/:style/:basename.:extension",
  #                  :path => "beatsbydre/:attachment/:id/:style/:basename.:extension",
  #                  :styles => lambda { |a| a.instance.images_styles? ? {:medium => "300x300>", :thumb => "100x100>"} : {} },
  #                  :storage => :s3,
  #                  :s3_credentials => {
  #                      :bucket => ENV['BUCKET_NAME'],
  #                      :access_key_id => ENV['ACCESS_ID'],
  #                      :secret_access_key => ENV['ACCESS_KEY']
  #                  }

end
