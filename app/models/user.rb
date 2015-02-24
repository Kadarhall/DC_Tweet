class User < ActiveRecord::Base

	#lookup user or create them
	def self.find_or_create_from_auth_hash(auth_hash)
		user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
		user.update(
			name: auth_hash.info.nickname,
			profile_image: auth_hash.info.image,
			token: auth_hash.credentials.token,
			secret: auth_hash.credentials.secret
		)
		user
	end

	def tweeting(tweet)
		@client ||= Twitter::REST::Client.new do |config|
			config.consumer_key        = ENV["twitter_key"]
			config.consumer_secret     = ENV["twitter_secret"]
			config.access_token        = token
			config.access_token_secret = secret
		end

		@client.update(tweet)

	end

	def streaming(location)
		@client ||= Twitter::REST::Client.new do |config|
			config.consumer_key        = ENV["twitter_key"]
			config.consumer_secret     = ENV["twitter_secret"]
			config.access_token        = token
			config.access_token_secret = secret
		end

		@client.filter(locations: "-122.75,36.8,-121.75,37.8") do |tweet|
		  puts tweet.text
		end
	end

	# def collect_with_max_id(collection=[], max_id=nil, &block)
	# 	response = yield(max_id)
	# 	collection += response
	# 	response.empty? ? collection.flatten : collection_with_max_id(collection, response.last.id - 1, &block)
	# end

	# def get_all_tweets(user)
	# 	collection_with_max_id do |max_id|
	# 		options = {count: 200, include_rts: true}
	# 		user_timeline(user, options)
	# 	end

	# 		@client.get_all_tweets(user)
	# end


end
