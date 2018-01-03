class TweetsController < ApplicationController
  before_action :authenticate_user!, :set_search
  
  def index
    @tweet = Tweet.new
  end
  
  def create
    @tweet = Tweet.new
    @tweet.attributes = input_parameter
    @tweet.user_id = current_user.id
    if @tweet.invalid?
      flash.now[:alert] = @tweet.errors.full_messages
      render :index
    else
      @tweet.save!
      flash[:notice] = I18n.t('tweet.save_success')
      redirect_to root_path
    end
  end
  
  def show 
    @tweet = Tweet.find(params[:id])
#    @reply_new = Tweet.new 
#    @reply = Tweet.where(reply_tweet_id: params[:id]).order("created_at DESC")
  end
  
  def update
    @tweet = Tweet.find(params[:id])
    @tweet.attributes = input_parameter
    if @tweet.invalid?
      flash.now[:alert] = @tweet.errors.full_messages
      @tweet.attributes = input_parameter
    else
      @tweet.save!
      flash.now[:notice] = I18n.t('tweet.update_success')
    end
    render :show
  end
  
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy!
    redirect_to root_path
  end
  
#  def reply
#    byebug
#    tweet = Tweet.new(reply_input_parameter)
#    tweet_id = tweet.reply_tweet_id
#    if tweet.invalid?
#      flash.now[:alert] = @tweet.errors.full_messages
#      @tweet.attributes = input_parameter
#      render :show
#    else
#      @tweet.save!
#      flash.now[:notice] = I18n.t('tweet.update_success')
#      redirect_to tweet_path(tweet_id)
#    end
#  end
  
  private 
  def input_parameter
    params.require(:tweet).permit(:content)
  end
  
#  def reply_input_parameter
#    params.require(:tweet).permit(:content, :reply_tweet_id)
#  end
  
end
