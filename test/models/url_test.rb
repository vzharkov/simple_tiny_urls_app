require 'test_helper'

class UrlTest < ActiveSupport::TestCase
  test 'valid url' do
    url = Urls::Create.new(url: 'http://google.com/').call
    assert url.valid?
  end

  test 'invalid url' do
    url = Urls::Create.new(url: 'www:1//google.com/').call
    refute url.valid?
    assert url.errors.messages[:url].first.include?('is not a valid URL')
  end
end
