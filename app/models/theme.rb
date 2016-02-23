class Theme < ActiveRecord::Base
  belongs_to :dream
  belongs_to :tag

  after_create :increment_counter_cache

  private
    def increment_counter_cache
      self.tag.dreams_count += 1
      self.tag.save
    end
end
