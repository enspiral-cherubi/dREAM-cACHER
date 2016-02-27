class View < ActiveRecord::Base
  belongs_to :user
  belongs_to :dream

  validates :user_id, presence: true
  validates :dream_id, presence: true
  validates_uniqueness_of :user_id, scope: :dream_id
end
