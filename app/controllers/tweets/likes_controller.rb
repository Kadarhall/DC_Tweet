class Tweets::LikesController < ApplicationController
	before_action :current_user
	before_action :set_tweet

	def create
		@tweet.likes.where(user_id: current_user.id).first_or_create

		respond_to do |format|
			format.html {redirect_to @tweet}
			format.js
		end
	end

	def destroy
		@tweet.likes.where(user_id: current_user.id).destroy_all

		respond_to do |format|
			format.html {redirect_to @tweet}
			format.js
		end
	end

	private

	def set_tweet
		@tweet = Tweet.find(params[:tweet_id])
	end
end