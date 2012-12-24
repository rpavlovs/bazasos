class PeopleController < ApplicationController
  before_filter :find_person, only: [:show, :edit, :update, :destroy]
  before_filter :create_person, only: :new

  def index
    @people = Person.scoped
    if params[:search]
      @search = OpenStruct.new(params[:search])
      @people = Person.search(@search)
    end
  end

  def show
  end

  def new
    render :edit
  end

  def edit
  end

  def create
    @person = Person.new(params[:person])
    if @person.save
      redirect_to @person, notice: 'Person was successfully created.'
    else
      render :edit
    end
  end

  def update
    if @person.update_attributes(params[:person])
      redirect_to @person, notice: 'Person was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @person.destroy
    redirect_to people_path
  end

  private

  def find_person
    @person = Person.find(params[:id])
  end

  def create_person
    @person = Person.new
  end
end
