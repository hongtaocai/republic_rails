class PubRate < ActiveRecord::Base

  belongs_to :rater, class_name: "User"
  belongs_to :rated, class_name: "Publication"
  validates :rater_id, presence: true
  validates :rated_id, presence: true
end
