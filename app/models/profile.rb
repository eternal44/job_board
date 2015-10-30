# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  name       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable

  acts_as_votable

  def score
    total = self.get_downvotes.size + self.get_upvotes.size
    if total != 0
      self.get_upvotes.size / total * 100
    else
      return 0
    end
  end

  def total
    self.get_downvotes.size + self.get_upvotes.size
  end
end
