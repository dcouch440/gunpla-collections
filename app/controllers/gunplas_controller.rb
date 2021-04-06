class GunplasController < ApplicationController
  def index
    @rand_gunplas = get_randoms(Gunpla.all)
    render :index
  end

  def show
    @gunpla = Gunpla.find(params[:id])
    render :show
  end

  def create
    @gunpla = Gunpla.new(gunpla_params)
    if @gunpla.save
      flash[:notice] = 'Gunpla successfully created'
      redirect_to gunplas_path
    else
      render :new
    end
  end

  def new
    @gunpla = Gunpla.new
    render :new
  end

  def edit
    @gunpla = Gunpla.find(params[:id])
    render :edit
  end

  def update
    @gunpla = Gunpla.find(params[:id])
    if @gunpla.update(gunpla_params)
      flash[:notice] = 'Gunpla successfully updated'
      redirect_to gunplas_path
    else
      render :edit
    end
  end

  def destroy
    @gunpla = Gunpla.find(params[:id]).destroy
    flash[:alert] = 'Gunpla has been successfully deleted'
    redirect_to gunplas_path
  end

  private

  def gunpla_params
    params.require(:gunpla).permit(:kit_name, :gundam_name, :gundam_series, :grade, :scale)
  end

  def get_randoms(data_array)
    data_array.sample(12)
  end
end