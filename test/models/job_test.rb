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

require 'test_helper'

class JobTest < ActiveSupport::TestCase
  def setup
    @valid_job = jobs(:one)
  end

  test "should be valid" do
    assert @valid_job.valid?
  end

  test "employer id should be present" do
    @valid_job.user_id = nil
    assert_not @valid_job.valid?
  end

end
