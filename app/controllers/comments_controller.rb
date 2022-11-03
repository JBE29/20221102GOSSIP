class CommentsController < ApplicationController
  before_action :authenticate_user, only: [ new ]

  # GET /comments or /comments.json
  def index
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
    @gossip = Gossip.find(params[:gossip_id])
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.gossip_id = params[:gossip_id]

    respond_to do |format|
      if @comment.save
        format.html { redirect_to gossip_path(@comment.gossip), notice: "Commentaire ajouté" }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    @comment = Comment.find(params[:id])
      if @comment.update(comment_params)
        format.html { redirect_to gossip_path(@comment.gossip), notice: "Commentaire modifié" }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to gossip_path(@comment.gossip.id), notice: "Commentaire supprimé" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content)
    end
    
    private

  def authenticate_user
    unless current_user
      flash.now[:alert] = "Il faut vous connecter"
      redirect_to new_session_path
    end
  end
end
