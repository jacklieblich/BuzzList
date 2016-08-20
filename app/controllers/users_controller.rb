class UsersController < ApplicationController
  require 'will_paginate/array'
  
  def index
    if params[:id] == nil
      if params[:search]
        users = User.search(params[:search])
      else
        users = User.all
      end
    users = users.sort_by { |user| Like.where(likable_id: user.quotes, likable_type: "Quote").count + Like.where(likable_id: user.clips, likable_type: "Clip").count}.reverse
    @users = users.paginate(page: params[:page], per_page: 20)
    @title = "All Users"
    else
      @user = User.find(params[:id])
      if params[:follow_type] == "followers"
        @users = @user.followers.paginate(page: params[:page], per_page: 20)
        @title = @user.name + "'s Followers"
      else
        @users = @user.following.paginate(page: params[:page], per_page: 20)
        @title = @user.name + " is Following"
      end
    end
  end
 
 def show
   @user = User.find(params[:id])
   @lists = List.where(user_id: params[:id])
   items = Quote.where(user_id: params[:id]) + Clip.where(user_id: params[:id])
   @items = items.sort_by { |item| item.likes.count }.reverse
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
