class PlumbersController < ApplicationController
  before_action :set_plumber, only: %i[ show edit update destroy ]

  # GET /plumbers or /plumbers.json
  def index
    @plumbers = Plumber.all
  end

  # GET /plumbers/1 or /plumbers/1.json
  def show
  end

  # GET /plumbers/new
  def new
    @plumber = Plumber.new
  end

  # GET /plumbers/1/edit
  def edit
  end

  # POST /plumbers or /plumbers.json
  def create
    @plumber = Plumber.new(plumber_params)

    respond_to do |format|
      if @plumber.save
        format.html { redirect_to plumber_url(@plumber), notice: "Plumber was successfully created." }
        format.json { render :show, status: :created, location: @plumber }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plumber.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /plumbers/1 or /plumbers/1.json
  def update
    respond_to do |format|
      if @plumber.update(plumber_params)
        format.html { redirect_to plumber_url(@plumber), notice: "Plumber was successfully updated." }
        format.json { render :show, status: :ok, location: @plumber }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @plumber.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /plumbers/1 or /plumbers/1.json
  def destroy
    @plumber.destroy

    respond_to do |format|
      format.html { redirect_to plumbers_url, notice: "Plumber was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_plumber
      @plumber = Plumber.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def plumber_params
      params.fetch(:plumber, {})
    end
end
