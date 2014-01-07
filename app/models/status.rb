class Status < ActiveRecord::Base

belongs_to :owner ,:polymorphic => :true
has_many :users, :class_name => "User", :through => :user_statuses
has_many :user_statuses

end

