class Voteaction < ActiveRecord::Base
  belongs_to :user
  belongs_to :publication

  after_save :update_counter_cache_p
  after_destroy :update_counter_cache_p

  def update_counter_cache_p
    self.publication.update_counter_cache
  end

end
