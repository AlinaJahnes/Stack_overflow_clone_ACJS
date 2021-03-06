class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :voteable, polymorphic: true
  validates :voteable_id, :voteable_type, :user_id, :value, presence: true

  def can_vote?
    vote = Vote.where(voteable_id: self.voteable_id, voteable_type: self.voteable_type, user_id: self.user_id)
    return vote.empty?
  end

end
