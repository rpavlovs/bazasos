class LocationsController < ApplicationController
  before_filter :find_person
  before_filter :find_location, only: [:edit, :update]

  def create
    @location = Location.new(params[:location].merge(person: @person))
    if @location.save
      redirect_to @person
    else
      render :edit
    end
  end

  def update
   if @location.update_attributes(params[:location])
     redirect_to @person
   else
     render :edit
   end
  end

  def new
    @location = Location.new
    render :edit
  end

  def edit
  end

  def destroy
    Location.find(params[:id]).destroy
    redirect_to :back
  end

  private

  def find_person
    @person = Person.find(params[:person_id])
  end

  def find_location
    @location = Location.find(params[:id])
  end
end
