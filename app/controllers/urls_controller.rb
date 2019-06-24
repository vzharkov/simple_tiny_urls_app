require_dependency 'urls/create'

class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create
    @url = ::Urls::Create.new(permitted_params).call
    redirect_to root_url if @url
  end

  def index
    @urls = Url.limit(25)
  end

  def show
    url = Url.find_by(token: params[:token])
    redirect_url = url ? url.url : root_url

    redirect_to redirect_url
  end

  private

  def permitted_params
    params.require(:url).permit(:url)
  end
end
