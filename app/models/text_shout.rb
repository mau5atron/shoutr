class TextShout < ApplicationRecord
	validates :body, presence: true, length: (1..140)
	# Moved over from shout model
end
