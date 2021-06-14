class LikesController < ApplicationController
    def create
      likes = {user_id: @user, tweet_id: @ss}
        if already_liked?
            flash[:notice] = "you cant"
        else
            @tweet.likes.create(user_id: current_user.id)
        end
        redirect_to tweet_path(@tweet)
    end

    def destroy
      if !(already_liked?)
        flash[:notice] = "cannot"
      else 
        @like.destroy
      end
      redirect_to tweet_path(@tweet)
    end

    private

    def find_tweet
        @tweet = Tweet.find_by(id: params[:id])
    end

    def already_liked?
      Like.where(user_id: current_user.id, tweet_id: params[:tweet_id]).exists?
    end

    def find_like
      @like = @tweet.likes.find(params[:id])
    end
  end
  