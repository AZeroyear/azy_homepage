class InformationsController < ApplicationController
  def index
    @infos = Information.all.reverse_order
    @new_info = Information.new
  end

  def update
    @info = Information.find(params[:id])
    if @info.update_attributes(info_params)
      redirect_to informations_path
    else
    end
  end

  def create
    @info = Information.new(info_params)
    @info.save
    redirect_to informations_path
  end

  private

    def info_params
      params.require(:information).permit(:information, :forecast_date, :close)
    end
end
