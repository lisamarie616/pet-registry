class AnimalsController < ApplicationController
  before_action :authenticate_user!

  def index
    @filterrific = initialize_filterrific(
      Animal,
      params[:filterrific],
      select_options: {
        with_animal_type: Animal.options_for_select
      },
      persistence_id: false,
    ) or return
    @animals = @filterrific.find

    respond_to do |format|
      format.html
      format.js
    end
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
    @animal = current_user.animals.build(animal_params)
    if @animal.save
      flash[:success] = "Animal successfully added!"
      redirect_to animal_path(@animal)
    else
      render :new
    end
  end

  def update
    @animal = load_animal
    authorize @animal
    if @animal.update(animal_params)
      flash[:success] = "Animal updated!"
      redirect_to animal_path(@animal)
    else
      render :edit
    end
  end

  def destroy
    @animal = load_animal
    authorize @animal
    @animal.destroy
    flash[:notice] = "Animal deleted from registry."
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