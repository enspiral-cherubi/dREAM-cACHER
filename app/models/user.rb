class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :dreams
  has_many :views
  
  before_validation :assign_uid_and_provider

  private
    def assign_uid_and_provider
      if !self.created_at && ( self.provider == "email" )
        set_time = Time.zone.now + 1.minute
        self.uid = self.email
        self.confirmed_at = set_time
        self.updated_at = set_time
      end
    end
end
