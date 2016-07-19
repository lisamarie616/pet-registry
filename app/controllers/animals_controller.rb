class AnimalsController < ApplicationController
  before_action :authenticate_user!

  def index
    @animals = Animal.all
  end

  def show
    @animal = load_animal
  end

  def new
    @animal = Animal.new
  end

  def edit
    @animal = load_animal
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      redirect_to animal_path(@animal)
    end
  end

  def update
    @animal = load_animal
    if @animal.update(animal_params)
      redirect_to animal_path(@animal)
    end
  end

  def destroy
    @animal = load_animal
    @animal.destroy
    redirect_to animals_path
  end

  private
  def load_animal
    Animal.find(params[:id])
  end

  def animal_params
    params.require(:animal).permit(:name, :animal_type, :sex, :avatar)
  end
end
