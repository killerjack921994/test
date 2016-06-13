class ManufacturersController < ApplicationController
  before_action :authentication
  before_action :set_manufacturer, only: [:show, :edit, :update, :destroy]

  # GET /manufacturers
  # GET /manufacturers.json
  def index
    @manufacturers = Manufacturer.all
  end

  # GET /manufacturers/1
  # GET /manufacturers/1.json
  def show
    if current_staff.admin
    else
      redirect_to manufacturers_path
    end
  end

  # GET /manufacturers/new
  def new
    if current_staff.admin
      @manufacturer = Manufacturer.new
    else
      redirect_to manufacturers_path
    end
  end

  # GET /manufacturers/1/edit
  def edit
    if current_staff.admin
    else
      redirect_to manufacturers_path
    end
  end

  # POST /manufacturers
  # POST /manufacturers.json
  def create
    @manufacturer = Manufacturer.new(manufacturer_params)

    respond_to do |format|
      if @manufacturer.save
        flash[:success] = 'Manufacturer was successfully created.'
        format.html { redirect_to new_manufacturer_path }
        format.json { render :show, status: :created, location: @manufacturer }
      else
        format.html { render :new }
        format.json { render json: @manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /manufacturers/1
  # PATCH/PUT /manufacturers/1.json
  def update
    respond_to do |format|
      if @manufacturer.update(manufacturer_params)
        flash[:success] = 'Manufacturer was successfully updated.'
        format.html { redirect_to edit_manufacturer_path }
        format.json { render :show, status: :ok, location: @manufacturer }
      else
        format.html { render :edit }
        format.json { render json: @manufacturer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /manufacturers/1
  # DELETE /manufacturers/1.json
  def destroy
    @manufacturer.destroy
    respond_to do |format|
      flash[:success] = 'Manufacturer was successfully destroyed.'
      format.html { redirect_to manufacturers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manufacturer
      @manufacturer = Manufacturer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manufacturer_params
      params.require(:manufacturer).permit(:name, :address, :phone, :fax)
    end
    
    def authentication
    if logged_in?
    else
      redirect_to login_path
    end
  end
end
