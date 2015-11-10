require 'test_helper'

class UsersTest < ActionDispatch::IntegrationTest
  self.use_transactional_fixtures = false

  def setup
    @employer = users(:employer)
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

  test 'employer can create a new job' do
    login_as(@employer)
    visit new_job_path
    assert page.has_content?('New Job')
    check 'cleaning'
    fill_in('Location', with: '1234 Main st')
    fill_in('Appointment date time', with: '10/01/2015 1:00 PM')
    find_button('Create Job')
    click_on 'Create Job'
    assert page.has_content?('cleaning'), 'job not created'
  end

  test 'update job as employer' do
    login_as(@employer)
    visit jobs_path
    assert page.has_content?('Listing Jobs'), 'not on index page'
    find(:css, 'i.fa.fa-search').click
    assert page.has_content?('Edit Job'), 'not on edit page'
    click_on('Edit Job')
    fill_in('Location', with: 'New Address Here')
    fill_in('Appointment date time', with: 'January 2, 2016 5:00 PM')
    click_on('Update Job')
    assert page.has_content?('New Address Here'), 'page not updated'
  end

end
