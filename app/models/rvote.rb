class Rvote < ActiveRecord::Base
  belongs_to :review
  belongs_to :user


  after_save :update_counter_cache_r
  after_destroy :update_counter_cache_r

  def update_counter_cache_r
    self.review.update_counter_cache
  end

end
