class UrlsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index  
  end

  def create
    @url = Url.find_by(url_params)

    if @url
      render status: :ok, json: { short_url: @url.short }
    else
      @url = Url.new(url_params)
      @url.generate_short_url
      if @url.save
        render status: :created, json: { short_url: @url.short }
      else
        render status: :unprocessable_entity, json: { errors: @url.errors.full_messages }
      end
    end
  end

  def show
    @url = Url.find_by_short(params[:short])

    if @url
      render status: :ok, json: { original_url: @url.original }
    else
      render status: :not_found, json: { error: "Not found" }
    end
  end

  private
    def url_params
      params.require(:url).permit(:original)
    end
end
