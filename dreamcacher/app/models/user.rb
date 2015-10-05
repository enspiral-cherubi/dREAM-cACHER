class User < ActiveRecord::Base

  include DeviseTokenAuth::Concerns::User
  has_many :dreams
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  before_validation :assign_uid_and_provider

  private

  def assign_uid_and_provider
    set_time = Time.zone.now + 1.minute
    self.uid = self.email
    self.provider = 'email'
    self.confirmed_at = set_time
    self.updated_at = set_time

  end
end
