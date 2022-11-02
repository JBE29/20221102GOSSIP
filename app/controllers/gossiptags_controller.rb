class GossiptagsController < ApplicationController
  before_action :set_gossiptag, only: %i[ show edit update destroy ]

  # GET /gossiptags or /gossiptags.json
  def index
    @gossiptags = Gossiptag.all
  end

  # GET /gossiptags/1 or /gossiptags/1.json
  def show
  end

  # GET /gossiptags/new
  def new
    @gossiptag = Gossiptag.new
  end

  # GET /gossiptags/1/edit
  def edit
  end

  # POST /gossiptags or /gossiptags.json
  def create
    @gossiptag = Gossiptag.new(gossiptag_params)

    respond_to do |format|
      if @gossiptag.save
        format.html { redirect_to gossiptag_url(@gossiptag), notice: "Gossiptag was successfully created." }
        format.json { render :show, status: :created, location: @gossiptag }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @gossiptag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gossiptags/1 or /gossiptags/1.json
  def update
    respond_to do |format|
      if @gossiptag.update(gossiptag_params)
        format.html { redirect_to gossiptag_url(@gossiptag), notice: "Gossiptag was successfully updated." }
        format.json { render :show, status: :ok, location: @gossiptag }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gossiptag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gossiptags/1 or /gossiptags/1.json
  def destroy
    @gossiptag.destroy

    respond_to do |format|
      format.html { redirect_to gossiptags_url, notice: "Gossiptag was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gossiptag
      @gossiptag = Gossiptag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gossiptag_params
      params.fetch(:gossiptag, {})
    end
end
