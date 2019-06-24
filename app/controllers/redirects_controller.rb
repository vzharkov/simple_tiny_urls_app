class RedirectsController < ApplicationController
  def show
    url = Url.find_by(token: params[:token])
    redirect_url = url ? url.url : root_url

    redirect_to redirect_url
  end
end
