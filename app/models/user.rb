class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #attr_accessible :email, :password
  validates_confirmation_of :password, :if => :password_required?
  #attr_accessible :email, :is_active, :is_super_admin

  has_one :profile
  has_many :locations, :through => :location_users# ,:class_name => "LocationUser"
  has_many :location_users
  has_many :statuses ,:as => :owner , :class_name => "Status", :dependent => :destroy
  has_many :statuses ,:through => :user_status
  has_many :user_status


  def password_required?
    true unless new_record? #and is_super_admin
  end
end
