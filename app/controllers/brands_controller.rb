class BrandsController < ApplicationController
  before_action :set_brand, only: [:show, :edit, :update, :destroy]

  # GET /brands
  # GET /brands.json
  def index
    # we only need the actual query to run via AJAX,
    # so no need to run it on page load
    respond_to do |format|
      format.html
      format.json {
        @brands = Brand.all
      }
    end
  end

  # GET /brands/1
  # GET /brands/1.json
  def show
    @images = @brand.images.includes(:brand_images)
    unless params[:quality].blank?
      @images = @images.where(brand_images: {match_quality: params[:quality]})
    end
    unless params[:popular].blank?
      popular = params[:popular] == 'true'
      if popular
        @images = @images.order('favorite_count DESC')
      else
        @images = @images.order('favorite_count ASC')
      end
    end
    @paged_images = @images.page(params[:page] || 1).per(params[:per] || 25)
  end

  # GET /brands/new
  def new
    @brand = Brand.new
  end

  # GET /brands/1/edit
  def edit
  end

  # POST /brands
  # POST /brands.json
  def create
    @brand = Brand.new(brand_params)

    respond_to do |format|
      if @brand.save
        format.html { redirect_to @brand, notice: 'Brand was successfully created.' }
        format.json { render :show, status: :created, location: @brand }
      else
        format.html { render :new }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brands/1
  # PATCH/PUT /brands/1.json
  def update
    respond_to do |format|
      if @brand.update(brand_params)
        format.html { redirect_to @brand, notice: 'Brand was successfully updated.' }
        format.json { render :show, status: :ok, location: @brand }
      else
        format.html { render :edit }
        format.json { render json: @brand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brands/1
  # DELETE /brands/1.json
  def destroy
    @brand.destroy
    respond_to do |format|
      format.html { redirect_to brands_url, notice: 'Brand was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brand
      @brand = Brand.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def brand_params
      params.require(:brand).permit!
    end
end
