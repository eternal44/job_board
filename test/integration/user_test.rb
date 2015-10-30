require 'test_helper'

class UsersTest < ActionDispatch::IntegrationTest
  self.use_transactional_fixtures = false

  def setup
    # @employer = users(:employer)
    @job = jobs(:one)
    Capybara.default_driver = :selenium
  end

  test 'employers can login' do
    visit '/users/sign_in'
    assert page.has_content?('Email'), 'not on employer login page'
    fill_in('Email', with: 'employer@gmail.com')
    fill_in('Password', with: 'password1234')
    find_button('Log in')
    click_on 'Log in'
    assert page.has_content?('Logout'), 'not logged in'
  end

  # test 'employer can create a new job' do
  #   login_as(@employer)
  #   visit new_job_path
  #   assert page.has_content?('Title')
  #   fill_in('Title', with: 'Clean 3 bedroom house')
  #   fill_in('Location', with: '1234 Main st')
  #   fill_in('Start', with: '10/01/2015 1:00 PM')
  #   fill_in('End', with: '10/17/2015 12:00 AM')
  #   find_button('Create Job')
  #   click_on 'Create Job'
  #   assert page.has_content?('Clean 3 bedroom house'), 'job not created'
  # end

#   test 'update job as employer' do
#     login_as(@employer)
#     visit jobs_path
#     assert page.has_content?('MyString')
#     first(:link, "Edit").click
#     assert page.has_content?('Title'), 'not on edit page'
#     fill_in('Title', with: 'Hello Test')
#     click_on('Update Job')
#     assert page.has_content?('Hello Test'), 'page not updated'
#   end
end
