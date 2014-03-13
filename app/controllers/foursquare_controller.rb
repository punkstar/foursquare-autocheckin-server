class FoursquareController < ApplicationController
  protect_from_forgery :except => :callback
  before_filter :authenticate_user!

  def initialize
    app_id = ENV['FOURSQUARE_APP_ID']
    app_secret = ENV['FOURSQUARE_APP_SECRET']

    @foursquare = OAuth2::Client.new(
      app_id,
      app_secret,
      :authorize_url => "/oauth2/authorize",
      :token_url => "/oauth2/access_token",
      :site => "https://foursquare.com/"
    )
  end

  def connect
    redirect_to @foursquare.auth_code.authorize_url(:redirect_uri => foursquare_callback_url)
  end

  def callback
    code = params[:code]
    token = @foursquare.auth_code.get_token(code, :redirect_uri => foursquare_callback_url)

    current_user.update(:foursquare_token => token.token)

    redirect_to root_path
  end
end
