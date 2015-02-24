class TweetsController < ApplicationController
	before_action :set_tweet, only: [:show, :edit, :update, :destroy]

	respond_to :html

	def index
		@tweets = Tweet.all
		respond_with(@tweets)
	end

	def show
		respond_with(@tweet)
	end

	def new
		# @tweet = Tweet.new
		# respond_with(@tweet)
	end

	def edit
	end

	def create
		@tweet = current_user.tweeting(tweet_params[:message])
		respond_with(@tweet)
	end

	def update
		@tweet.update(tweet_params)
		respond_with(@tweet)
	end

	def destroy
		@tweet.destroy
	end

	private

	def tweet_params
		params.require(:tweet).permit(:message)
	end
end
