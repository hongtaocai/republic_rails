class Avote < ActiveRecord::Base
  belongs_to :answer
  belongs_to :user

  after_save :update_counter_cache_a
  after_destroy :update_counter_cache_a

  def update_counter_cache_a
    self.answer.update_counter_cache
  end
end
