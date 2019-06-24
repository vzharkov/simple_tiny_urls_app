require_dependency 'urls/create'

class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create
    @url = ::Urls::Create.new(permitted_params).call
    if @url
      flash[:notice] = 'Url created'
      puts url_url(@url.id)
      redirect_to url_url(@url.token)
    end
  end

  def index
    @urls = Url.ordered.limit(25)
  end

  def show
    @url = Url.find_by(token: params[:id])
  end

  private

  def permitted_params
    params.require(:url).permit(:url)
  end
end
