class User < ActiveRecord::Base
  has_many :questions, dependent: :destroy
  has_many :answers, dependent: :destroy
  has_many :reviews, dependent: :destroy

  has_many :voteactions
  has_many :voted_publications, through: :voteactions, source: :publication

  has_many :qvotes
  has_many :voted_questions, through: :qvotes, source: :question

  has_many :avotes
  has_many :voted_answers, through: :avotes, source: :answer

  has_many :rvotes
  has_many :voted_reviews, through: :rvotes, source: :review

  has_secure_password

  before_create :create_remember_token

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash_of(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def voting_pub?(pub)
    voteactions.find_by(publication_id: pub.id)
  end

  def vote_pub!(pub)
    voteactions.create!(publication_id: pub.id)
  end

  def unvote_pub!(pub)
    voteactions.find_by(publication_id: pub.id).destroy
  end

  def voting_q?(q)
    qvotes.find_by(question_id: q.id)
  end

  def vote_q!(q)
    qvotes.create!(question_id: q.id)
  end

  def unvote_q!(q)
    qvotes.find_by(question_id: q.id).destroy
  end

  def voting_a?(a)
    avotes.find_by(answer_id: a.id)
  end

  def vote_a!(a)
    avotes.create!(answer_id: a.id)
  end

  def unvote_a!(a)
    avotes.find_by(answer_id: a.id).destroy
  end

  def voting_r?(r)
    rvotes.find_by(review_id: r.id)
  end

  def vote_r!(r)
    rvotes.create!(review_id: r.id)
  end

  def unvote_r!(r)
    rvotes.find_by(review_id: r.id).destroy
  end

  private
    def create_remember_token
      self.remember_token = User.hash_of(User.new_remember_token)
    end

end
