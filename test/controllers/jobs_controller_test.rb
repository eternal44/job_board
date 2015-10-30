require 'test_helper'

class JobsControllerTest < ActionController::TestCase
  def setup
    @valid_job = jobs(:one)
    sign_in users(:employer)
  end

  test 'should show job' do
    get :show, id: @valid_job
    assert_equal("MyString", @valid_job.title)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(@jobs)
  end

  test 'should destroy job' do
    assert_difference 'Job.count', -1 do
      delete :destroy, id: @valid_job
    end
  end

  # test 'if signed in as employer should only show own jobs' do
  #   sign_in users(:employer)
  #   get :show, id: jobs(:two)
  #   assert_response :redirect
  # end

end
