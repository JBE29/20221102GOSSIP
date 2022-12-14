class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :edit, :show]

  # GET /gossips or /gossips.json
  def index
    @gossips = Gossip.all
  end

  # GET /gossips/1 or /gossips/1.json
  def show
  end

  # GET /gossips/new
  def new
    @gossip = Gossip.new
  end

  # GET /gossips/1/edit
  def edit
  end

  # POST /gossips or /gossips.json
  def create
    @gossip = Gossip.new('user_id' => current_user.id, 'title' => params[:title],'content' => params[:content])
 

    if @gossip.save
      flash[:success] = "Potin bien créé !"
      redirect_to root_path
    else
      render :new
    end
  end

  # PATCH/PUT /gossips/1 or /gossips/1.json
  def update
    respond_to do |format|
      if @gossip.update(gossip_params)
        format.html { redirect_to gossip_url(@gossip), notice: "Gossip was successfully updated." }
        format.json { render :show, status: :ok, location: @gossip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @gossip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gossips/1 or /gossips/1.json
  def destroy
    @gossip.destroy

    respond_to do |format|
      format.html { redirect_to gossips_url, notice: "Gossip was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gossip
      @gossip = Gossip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gossip_params
      params.require(:gossip).permit(:title, :content)
    end

    def update_params
      params.require(:gossip).permit(:title, :content)
    end
end
