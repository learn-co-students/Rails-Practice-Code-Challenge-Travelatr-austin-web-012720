class DestinationsController < ApplicationController
  def index
    @destinations = Destination.all 
  end

  def show
    @destination = Destination.find(params[:id]) 
  end

  def new
    @destination = Destination.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end
end
