class TweetsController < ApplicationController
  before_action :authenticate_user!, :set_search
  
  def index
    @tweet = Tweet.new
  end
  
  def create
    tweet = Tweet.new
    tweet.attributes = input_parameter
    tweet.user_id = current_user.id
    if tweet.invalid?
      flash[:alert] = I18n.t('tweet.save_fail')
    else
      tweet.save!
      flash[:notice] = I18n.t('tweet.save_success')
    end
    redirect_to root_path
  end
  
  def show 
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    tweet = Tweet.find(params[:id])
    tweet.attributes = input_parameter
    if tweet.invalid?
      flash.now[:alert] = @tweet.errors.full_messages
      @tweet.attributes = input_parameter
      render :show
    else
      tweet.save!
      flash.now[:notice] = I18n.t('tweet.update_success')
      redirect_to tweet_path(params[:id])
    end
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy!
    redirect_to root_path
  end
  
  private 
  def input_parameter
    params.require(:tweet).permit(:content)
  end
  
end
