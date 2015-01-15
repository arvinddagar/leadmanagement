class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :daily_updates
  has_many :service_calls
  ROLES = ["Admin", "Executive","Manager"]
  scope :meeting, lambda {|id| find(id)}
  
end
