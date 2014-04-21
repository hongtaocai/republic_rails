class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :publication


  has_many :rvotes, dependent: :destroy
  has_many :voters, through: :rvotes, source: :user, counter_cache: true

  default_scope { order("voters_count DESC") }

  def update_counter_cache
    update_attribute(:voters_count, self.voters.length) unless self.voters.length == self.voters_count
  end



end
