class MedicalConditionsController < ApplicationController
  before_filter :find_person
  before_filter :find_medical_condition, only: [:edit, :update, :destroy]

  def create
    @medical_condition = MedicalCondition.new(params[:medical_condition].merge(person: @person))
    if @medical_condition.save
      redirect_to @person
    else
      render :edit
    end
  end

  def update
   if @medical_condition.update_attributes(params[:medical_condition])
     redirect_to @person
   else
     render :edit
   end
  end

  def new
    @medical_condition = MedicalCondition.new
    render :edit
  end

  def edit
  end

  def destroy
    @medical_condition.destroy
    redirect_to @person
  end

  private

  def find_person
    @person = Person.find(params[:person_id])
  end

  def find_medical_condition
    @medical_condition = MedicalCondition.find(params[:id])
  end
end
