# == Schema Information
#
# Table name: jobs
#
#  id                       :integer          not null, primary key
#  title                    :string
#  location                 :string
#  first_start_time_choice  :text
#  second_start_time_choice :text
#  user_id                  :integer
#  status                   :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class Job < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable

  validates :title, presence: true
  validates :location, presence: true
  validates :first_start_time_choice, presence: true
  validates :status, presence: true
  validates :user_id, presence: true

end
