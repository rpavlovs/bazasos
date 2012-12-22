class AllergiesController < ApplicationController
  before_filter :find_person
  before_filter :find_allergy, only: [:edit, :update]

  def create
    @allergy = Allergy.new(params[:allergy].merge(person: @person))
    if @allergy.save
      redirect_to @person
    else
      render :edit
    end
  end

  def update
   if @allergy.update_attributes(params[:allergy])
     redirect_to @person
   else
     render :edit
   end
  end

  def new
    @allergy = Allergy.new
    render :edit
  end

  def edit
  end

  def destroy
    Allergy.find(params[:id]).destroy
    redirect_to :back
  end

  private

  def find_person
    @person = Person.find(params[:person_id])
  end

  def find_location
    @allergy = Allergy.find(params[:id])
  end
end
