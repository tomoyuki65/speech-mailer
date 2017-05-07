require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
   @base_title = "Speech Mailser"
  end

  test "should get root" do
    get root_url
    assert_response :success
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", "Speech Mailer"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About | Speech Mailer"
  end

  test "should get use" do
    get static_pages_use_url
    assert_response :success
    assert_select "title", "Use | Speech Mailer"
  end

  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
    assert_select "title", "Contact | Speech Mailer"
  end

end
