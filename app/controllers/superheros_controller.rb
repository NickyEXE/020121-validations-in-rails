class SuperherosController < ApplicationController
  before_action :set_superhero, only: [:show, :edit, :update, :destroy]

  def index
    @superheros = Superhero.all
    render :index
  end

  def show
    render :show
  end

  def new
    @superhero = Superhero.new
    render :new
  end

  def create
    @superhero = Superhero.create(superhero_params)
    if @superhero.valid?
      redirect_to @superhero
    else
      render :new
    end
  end

  def edit
    render :edit
  end

  def update
    if @superhero.update(superhero_params)
      redirect_to @superhero
    else
      render :edit
    end
  end

  def destroy
    @superhero.destroy
    redirect_to superheros_path
  end

  private

  def set_superhero
    @superhero = Superhero.find(params[:id])
  end

  def superhero_params
    params.require(:superhero).permit(:name, :power, :power_level, :good)
  end

end
