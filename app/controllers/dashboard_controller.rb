class DashboardController < ApplicationController
	def show
		@shout = Shout.new
	end
end
