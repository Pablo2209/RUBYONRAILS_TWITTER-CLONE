class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[ show edit update destroy ]

  def likes
    @tweet = Tweet.all.find(params[:id])
    Like.create(user_id: current_user.id, tweet_id: @tweet.id)
    redirect_to tweets_path(@tweet), notice: 'Liked!'
  end


  # GET /tweets or /tweets.json
  def index
    @tweets = Tweet.all.order("created_at DESC")
    @tweet = Tweet.new
    #Codigo de kaminari
    @tweets = Tweet.page params[:page]
  end

  # GET /tweets/1 or /tweets/1.json
  def show
  end

  # GET /tweets/new
  def new
    #MOdificacion para utilizar la asociacion entre usuario y tweets
    @tweet = current_user.tweets.build
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets or /tweets.json
  def create
    #MOdificacion para utilizar la asociacion entre usuario y tweets
    @tweet = current_user.tweets.build(tweet_params)

    respond_to do |format|
      if @tweet.save
        #Agregamos tweets_path  para que actualize los tweet y se quede en la misma pagina
        format.html { redirect_to tweets_path, notice: "Tweet was successfully created." }
        format.json { render :show, status: :created, location: @tweet }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1 or /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: "Tweet was successfully updated." }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1 or /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: "Tweet was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:tweet)
    end
end
