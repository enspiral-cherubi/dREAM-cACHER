class User < ActiveRecord::Base
  has_many :dreams
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
