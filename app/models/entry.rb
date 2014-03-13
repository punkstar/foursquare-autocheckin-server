class Entry < ActiveRecord::Base
  include ActiveModel::Validations

  validates_presence_of :device_id

  belongs_to :device
end
