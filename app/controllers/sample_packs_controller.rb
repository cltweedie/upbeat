class SamplePacksController < ApplicationController

  before_filter :load_sample_pack, only: [ :show, :download ]

  def new
    @pack = SamplePack.new
  end

  def create
    @pack = SamplePack.new(sample_pack_params)
    @pack.seller = current_producer
    if @pack.save
      flash[:notice] = "Sample pack uploaded successfully"
      redirect_to sample_packs_path
    end
  end

  def index
    @sample_packs = SamplePack.all
  end

  def download
    redirect_to "https://upbeat-sounds.s3.amazonaws.com/#{@sample_pack.file.path}"
  end

  private
  def sample_pack_params
    params.require(:sample_pack).permit(:title, :file, :price, :cover_image, :description)
  end

  def load_sample_pack
    @sample_pack = SamplePack.find(params[:id])
  end
end
