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
#  job_categories        :string
#

class Job < ActiveRecord::Base
  belongs_to :user
  has_many :comments, as: :commentable
  has_and_belongs_to_many :job_types

  validates :location, presence: true
  validates :appointment_date_time, presence: true
  validates :user_id, presence: true
  validates :status, presence: true

  def minimum_price_estimate
    self.min_hours * self.number_of_workers * self.price_per_worker
  end

  def maximum_price_estimate
    self.max_hours * self.number_of_workers * self.price_per_worker
  end

  def estimate_params_present?
    self.max_hours.present? && self.number_of_workers.present? && self.price_per_worker.present?
  end

end
