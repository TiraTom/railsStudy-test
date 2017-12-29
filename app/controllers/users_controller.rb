class UsersController < ApplicationController
  before_action :authenticate_user!, :set_search
  
  def show
    @user = User.find(params[:id])
    tweets = Tweet.where(user_id: params[:id])
    @tweets = tweets.page(params[:page])
  end
  
end
