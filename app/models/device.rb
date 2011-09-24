class Device < ActiveRecord::Base
  validates_presence_of :udid
  validates_uniqueness_of :udid
end
