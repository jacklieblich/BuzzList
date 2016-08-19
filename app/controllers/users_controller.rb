class UsersController < ApplicationController
  
  def index
    if params[:id] == nil
    @users = User.all
    @title = "All Users"
    else
      @user = User.find(params[:id])
      if params[:follow_type] == "followers"
        @users = @user.followers
        @title = @user.name + "'s Followers"
      else
        @users = @user.following
        @title = @user.name + " is Following"
      end
    end
  end
 
 def show
   @user = User.find(params[:id])
   @lists = List.where(user_id: params[:id])
 end
 
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to BuzzList!"
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end
