class ApplicationController < ActionController::Base
  include Clearance::Controller
  protect_from_forgery with: :exception

  def current_user
  	# calls default current user
  	super || Guest.new
  	# if current user returns nil, try or guest
  end
end
