class SamplePacksController < ApplicationController

  def new
    @pack = SamplePack.new
  end

  def create
    @pack = SamplePack.new(sample_pack_params)
    @pack.seller = current_producer
    if @pack.save
      flash[:notice] = "Sample pack uploaded successfully"
      redirect_to sample_pack_path(@pack)
    end
  end

  def show
    @sample_pack = SamplePack.find(params[:id])
  end

  def index
    @sample_packs = SamplePack.all
  end

  private
  def sample_pack_params
    params.require(:sample_pack).permit(:title, :file, :price, :cover_image, :description)
  end
end
