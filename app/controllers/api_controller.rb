class ApiController < ApplicationController
  def ping
    response = {}

    mac_addresses = params[:mac_addresses].split ","
    devices = Device.where('mac_address IN (?)', mac_addresses)

    devices.each do |device|
      device.user.checkin ENV['FOURSQUARE_VENUE_ID']
    end

    respond_to do |format|
      format.json { render :json => response }
    end
  end
end
