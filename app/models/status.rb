class Status < ActiveRecord::Base

belongs_to :user ,:polymorphic => :true
has_and_belongs_to_many :user#, :polymorphic => :true

end

