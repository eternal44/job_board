# == Schema Information
#
# Table name: job_types
#
#  id         :integer          not null, primary key
#  job_type   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class JobType < ActiveRecord::Base
  has_and_belongs_to_many :jobs, dependent: :destroy
end
