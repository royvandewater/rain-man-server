require 'spec_helper'

describe Device do

  describe "validations" do
    it "requires a udid" do
      @device = Device.new()
      @device.save.should be_false
      @device.errors.full_messages.should include "Udid can't be blank"
    end

    it "requires udid to be unique" do
      Factory.create :device, :udid => 'android'

      @device = Device.new :udid => 'android'
      @device.save.should be_false
      @device.errors.full_messages.should include "Udid has already been taken"
    end
  end
end
