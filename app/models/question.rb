class Question < ActiveRecord::Base
  belongs_to :publication
  belongs_to :user
  has_many :answers
  validates :publication_id, presence: true
  validates :user_id, presence: true

  has_many :qvotes, dependent: :destroy
  has_many :voters, through: :qvotes, source: :user, counter_cache: true

  default_scope { order("voters_count DESC") }

  def update_counter_cache
    update_attribute(:voters_count, self.voters.length) unless self.voters.length == self.voters_count
  end


end
