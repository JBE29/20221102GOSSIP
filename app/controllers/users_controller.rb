class UsersController < ApplicationController
  #before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(first_name:params[:first_name], last_name:params[:last_name], 
    age:params[:age], description:params[:description], email:params[:email], 
    password:params[:password], 
    password_confirmation:params[:password_confirmation], city: City.all.sample)
    if @user.save
      flash[:notice] = "Vous allez recevoir un email de confirmation."
      redirect_to root_path
    else
      flash.now[:danger] = 'Email ou mot de passe erroné.'
      render 'new'
    end  
  end  

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :description, :email, :age)
    end

    def cities_list
      cities =[]
      City.all.each {|city| cities << city}
      return cities
    end
end
