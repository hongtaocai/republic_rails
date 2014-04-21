class Publication < ActiveRecord::Base

  has_many :voteactions, dependent: :destroy
  has_many :voters, through: :voteactions, source: :user, counter_cache: true


  default_scope { order("voters_count DESC") }

  # has_many :reverse_pub_rates, foreign_key: "rated_id", class_name: "PubRate", dependent: :destroy
  # has_many :raters, through: :reverse_pub_rates, source: :rater

  has_many :questions, dependent: :destroy
  has_many :reviews, dependent: :destroy

  #after_save :update_counter_cache


  def update_counter_cache
    update_attribute(:voters_count, self.voters.length) unless self.voters.length == self.voters_count
  end

end
