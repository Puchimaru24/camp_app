class GearsController < ApplicationController
  def index
    @gears = Gear.all
  end

  def new
    @gear = Gear.new
  end
  
  def create
    redirect_to gears_path
  end
  
end
