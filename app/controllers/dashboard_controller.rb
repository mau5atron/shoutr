class DashboardController < ApplicationController
	def show
		@shout = Shout.new
		@shouts = current_user.timeline_shouts.order("created_at DESC")
	end
end
