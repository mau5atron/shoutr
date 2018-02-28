class HashtagsController < ApplicationController
	def show
		@search = Search.new(term: hashtag)
	end

	private

	def hashtag
		params[:id]
	end
	# important note - controllers should know what it wants
	# but not how to get it 
	# moving results component into shout model
end