class MedicationsController < ApplicationController
  before_filter :find_person
  before_filter :find_medication, only: [:edit, :update]

  def create
    @medication = Medication.new(params[:medication].merge(person: @person))
    if @medication.save
      redirect_to @person
    else
      render :edit
    end
  end

  def update
   if @medication.update_attributes(params[:medication])
     redirect_to @person
   else
     render :edit
   end
  end

  def new
    @medication = Medication.new
    render :edit
  end

  def edit
  end

  def destroy
    Medication.find(params[:id]).destroy
    redirect_to :back
  end

  private

  def find_person
    @person = Person.find(params[:person_id])
  end

  def find_location
    @medication = Medication.find(params[:id])
  end
end
