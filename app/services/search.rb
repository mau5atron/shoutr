class Search
	attr_reader :term
	def initialize(term:)
		@term = term
	end

	def run
		ShoutSearchQuery.new(term: "##{term}").to_relation
	end

	alias results run
	# an alias for run function
	# when called it will be results 
	# but is actually calling run
	
end