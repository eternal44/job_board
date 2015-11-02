# == Schema Information
#
# Table name: jobs
#
#  id                    :integer          not null, primary key
#  subject               :string
#  location              :string
#  appointment_date_time :text
#  user_id               :integer
#  status                :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  attendant_id          :integer
#  priority              :string
#  overdue               :boolean          default(FALSE)
#  number_of_workers     :integer
#  min_hours             :integer
#  max_hours             :integer
#  price_per_worker      :decimal(, )
#

class Job < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  has_and_belongs_to_many :job_types

  validates :location, presence: true
  validates :first_start_time_choice, presence: true
  validates :user_id, presence: true
  validates :status, presence: true

end
