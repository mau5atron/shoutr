class Timeline
	def initialize(users, scope = Shout)
		@users = users
		@scope = scope
	end

	def shouts
		scope.where(user_id: users).order(created_at: :desc)
		# copied over from timeline shouts in user model
	end

	def to_partial_path
		'timelines/timeline'
	end

	private 

	attr_reader :users, :scope
	# added scope for future usability to pass in a scope
end