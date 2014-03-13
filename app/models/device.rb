class Device < ActiveRecord::Base
  include ActiveModel::Validations

  validates_presence_of :name
  validates_presence_of :mac_address

  belongs_to :user
  has_many :entries

  def seen_today?(today=nil)
    today = DateTime.now if today.nil?

    limit_start = DateTime.new(today.year, today.month, today.day)
    limit_end   = DateTime.new(today.year, today.month, today.day, 23, 59, 59)

    entries.where(:created_at => limit_start..limit_end).count > 0
  end
end
