class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :devices, :dependent => :destroy

  def foursquare_client
    Foursquare2::Client.new(:oauth_token => foursquare_token, :api_version => '20140312')
  end

  def seen_today?(today=nil)
    devices.each do |device|
      return true if device.seen_today?(today)
    end

    return false
  end

  def checkin(venue_id)
    venue = foursquare_client.venue(venue_id)
    venue_lat_lon = "%.5f,%.5f" % [venue.location.lat, venue.location.lng]

    foursquare_client.add_checkin(
      :venueId => venue_id,
      :broadcast => 'private',
      :shout => "Automatic check-in.",
      :ll => venue_lat_lon,
      :llAcc => 1,
      :alt => 0,
      :altAcc => 1
    )
  end
end
