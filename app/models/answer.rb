class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  validates :question_id, presence: true
  validates :user_id, presence: true

  has_many :avotes, dependent: :destroy
  has_many :voters, through: :avotes, source: :user, counter_cache: true

  default_scope { order("voters_count DESC")}

  def update_counter_cache
    update_attribute(:voters_count, self.voters.length) unless self.voters.length == self.voters_count
  end
end
