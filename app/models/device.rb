class Device < ActiveRecord::Base
  include ActiveModel::Validations

  validates_presence_of :name
  validates_presence_of :mac_address

  belongs_to :user
end
