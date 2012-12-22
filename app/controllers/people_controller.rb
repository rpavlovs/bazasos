class PeopleController < ApplicationController
  def index
    @people = Person.scoped
    if params[:search]
      @search = OpenStruct.new(params[:search])
      @people = Person.search(@search)
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
