require "application_system_test_case"

class UrlsTest < ApplicationSystemTestCase
  setup do
    @url = urls(:one)
  end

  test "visiting the index" do
    visit urls_url
    assert_selector "h1", text: "Create short url!"
    assert page.has_content?(@url.url)
  end

  test "creating a Url" do
    visit urls_url
    click_on "New Url"
    fill_in 'url_url', with: 'google.com'

    click_on "Create url"
    assert page.has_content?('Url created')
  end


  test 'redirect from short url' do
    visit u_url(@url.token)
    assert current_path, @url.url
  end
end
