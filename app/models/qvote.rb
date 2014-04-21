class Qvote < ActiveRecord::Base
  belongs_to :question
  belongs_to :user

  after_save :update_counter_cache_q
  after_destroy :update_counter_cache_q

  def update_counter_cache_q
    self.question.update_counter_cache
  end
end
