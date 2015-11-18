class Dream < ActiveRecord::Base
  belongs_to :user
  has_many :themes
  has_many :tags, through: :themes
end
