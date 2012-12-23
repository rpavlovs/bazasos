class EmergencyContactsController < ApplicationController
  before_filter :find_person
  before_filter :find_emergency_contact, only: [:edit, :update]

  def create
    @emergency_contact = EmergencyContact.new(params[:emergency_contact].merge(person: @person))
    if @emergency_contact.save
      redirect_to @person
    else
      render :edit
    end
  end

  def update
   if @emergency_contact.update_attributes(params[:emergency_contact])
     redirect_to @person
   else
     render :edit
   end
  end

  def new
    @emergency_contact = EmergencyContact.new
    render :edit
  end

  def edit
  end

  def destroy
    EmergencyContact.find(params[:id]).destroy
    redirect_to :back
  end

  private

  def find_person
    @person = Person.find(params[:person_id])
  end

  def find_emergency_contact
    @emergency_contact = EmergencyContact.find(params[:id])
  end
end
