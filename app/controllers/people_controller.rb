class PeopleController < ApplicationController
  def index
    @people = Person.scoped
    if params[:search]
      @search = PersonSearchObject.new(params[:search])
      @people = @people.where("family_name ilike '%#{@search.family_name}%'") if @search.family_name.present?
      @people = @people.where("given_name ilike '%#{@search.given_name}%'") if @search.given_name.present?
      @people = @people.where("middle_name ilike '%#{@search.middle_name}%'") if @search.middle_name.present?
      @people = @people.where(cell_num: @search.phone_number) if @search.phone_number.present?
    end

  end

  def show
    @person = Person.find(params[:id])
  end

  def new
    @person = Person.new
  end

  def edit
    @person = Person.find(params[:id])
  end

  def create
    @person = Person.new(params[:person])

    if @person.save
      redirect_to @person, notice: 'Person was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    @person = Person.find(params[:id])

    if @person.update_attributes(params[:person])
      redirect_to @person, notice: 'Person was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @person = Person.find(params[:id])
    @person.destroy
    redirect_to people_url
  end
end
