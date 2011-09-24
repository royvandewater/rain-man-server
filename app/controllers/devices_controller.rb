class DevicesController < ApplicationController
  def index
    @devices = Device.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @device = Device.find_by_udid!(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @device }
    end
  end

  def new
    @device = Device.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @device }
    end
  end

  def edit
    @device = Device.find_by_udid!(params[:id])
  end

  def create
    @device = Device.new(params[:device])

    respond_to do |format|
      if @device.save
        format.html { redirect_to device_path(@device.udid), notice: 'Device was successfully created.' }
        format.json { render json: @device, status: :created, location: device_path(@device.udid) }
      else
        format.html { render action: "new" }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @device = Device.find_by_udid!(params[:id])

    respond_to do |format|
      if @device.update_attributes(params[:device])
        format.html { redirect_to device_path(@device.udid), notice: 'Device was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @device = Device.find_by_udid!(params[:id])
    @device.destroy

    respond_to do |format|
      format.html { redirect_to devices_url }
      format.json { head :ok }
    end
  end
end
