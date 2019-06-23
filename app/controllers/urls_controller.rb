class UrlsController < ApplicationController
  def new; end

  def create
    @url = Urls::Create.new(permitted_params).call
  end

  def index
    @urls = Url.limit(25)
  end
end
