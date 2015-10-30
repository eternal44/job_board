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

require 'test_helper'

class JobTest < ActiveSupport::TestCase
  def setup
    @valid_job = jobs(:one)
  end

  test "should be valid" do
    assert @valid_job.valid?
  end

  test "employer id should be present" do
    @valid_job.employer_id = nil
    assert_not @valid_job.valid?
  end

end
