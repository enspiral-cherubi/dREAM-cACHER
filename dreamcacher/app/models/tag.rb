class Tag < ActiveRecord::Base
  has_many :themes
  has_many :dreams, through: :themes
end
