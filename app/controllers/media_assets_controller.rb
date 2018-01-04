class MediaAssetsController < ApplicationController
  before_action :set_media_asset, only: [:show, :edit, :update, :destroy]

  # GET /media_assets
  # GET /media_assets.json
  def index

    @formats = MediaAsset.distinct("General.format").unshift("")
    @formatProfiles = MediaAsset.distinct("General.format_profile").unshift("")
    query = Mongoid::Criteria.new(MediaAsset)
    if (params[:search_name] != "")&&(params[:search_name] != nil)
      query = query.where({:filename => /.*#{params[:search_name]}.*/})
      #@media_assets = MediaAsset.where({:filename => /.*#{params[:search_name]}.*/, :"General.format" => params[:format], :"General.format_profile" => params[:format_profile]})
    end
    if (params[:format] != "")&&(params[:format] != nil)
      query = query.where({:"General.format" => params[:format]})
    end
    if (params[:format_profile] != "")&&(params[:format_profile] != nil)
      query = query.where({:"General.format_profile" => params[:format_profile]})
    end
    if query.selector.count > 0
      @media_assets = query.order_by(:filename => 1)
    else
      @media_assets = ""
    end
  end

  # GET /media_assets/1
  # GET /media_assets/1.json
  def show
  end

  # GET /media_assets/new
  def new
    @media_asset = MediaAsset.new
  end

  # GET /media_assets/1/edit
  def edit
  end

  # POST /media_assets
  # POST /media_assets.json
  def create
    @media_asset = MediaAsset.new(media_asset_params)

    respond_to do |format|
      if @media_asset.save
        format.html { redirect_to @media_asset, notice: 'Media asset was successfully created.' }
        format.json { render :show, status: :created, location: @media_asset }
      else
        format.html { render :new }
        format.json { render json: @media_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /media_assets/1
  # PATCH/PUT /media_assets/1.json
  def update
    respond_to do |format|
      if @media_asset.update(media_asset_params)
        format.html { redirect_to @media_asset, notice: 'Media asset was successfully updated.' }
        format.json { render :show, status: :ok, location: @media_asset }
      else
        format.html { render :edit }
        format.json { render json: @media_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /media_assets/1
  # DELETE /media_assets/1.json
  def destroy
    @media_asset.destroy
    respond_to do |format|
      format.html { redirect_to media_assets_url, notice: 'Media asset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_media_asset
      @media_asset = MediaAsset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def media_asset_params
      params.require(:media_asset).permit(:filename, :fumber, :created, :modified, :size, :checksum)
    end
end
