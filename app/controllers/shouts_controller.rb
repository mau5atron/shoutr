class ShoutsController < ApplicationController
	def create
		current_user.shouts.create(shout_params)
		# allows current user to create shouts
		redirect_to root_path
	end

	private 

	def shout_params
		params.require(:shout).permit(:body)
		#  strong params that allows current user to create shouts
	end
end
