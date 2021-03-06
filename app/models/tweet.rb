class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :likes

  validates :user_id, :body, presence: true

  before_create :post_to_twitter

  def post_to_twitter
    user.twitter.update(body)
  end
end