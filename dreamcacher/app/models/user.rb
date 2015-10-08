class User < ActiveRecord::Base

  include DeviseTokenAuth::Concerns::User
  has_many :dreams
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable


  before_validation :assign_uid_and_provider

  private

  def assign_uid_and_provider
    if !self.created_at && ( self.provider == "email" )
      p '*' * 40
      p self
      set_time = Time.zone.now + 1.minute
      self.uid = self.email
      self.confirmed_at = set_time
      self.updated_at = set_time
    end
  end
end
