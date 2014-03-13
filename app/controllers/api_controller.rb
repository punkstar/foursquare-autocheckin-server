class ApiController < ApplicationController
  def ping
    response = {}

    mac_addresses = (params[:mac_addresses].upcase || "").split ","
    devices = Device.where('mac_address IN (?)', mac_addresses)

    total_devices_found = 0
    total_users_checked_in = 0

    devices.each do |device|
      total_devices_found = total_devices_found + 1

      unless device.user.seen_today?
        total_users_checked_in = total_users_checked_in + 1

        device.user.checkin ENV['FOURSQUARE_VENUE_ID']
        device.entries << Entry.create(
          :created_at => DateTime.now
        )
      end
    end

    response[:total_devices] = total_devices_found
    response[:total_checked_in] = total_users_checked_in

    respond_to do |format|
      format.json { render :json => response }
    end
  end
end
