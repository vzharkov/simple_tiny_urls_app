module Urls
  class Create
    def initialize(params)
      @url = params[:url]
    end

    def call
      Url.create(url: @url, token: token)
    end

    private

    def token
      Digest::SHA1.hexdigest(@url)[7..16]
    end
  end
end
