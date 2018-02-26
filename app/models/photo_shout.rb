class PhotoShout < ApplicationRecord
	has_attachment_file :image, styles: { thumb: "200x200"}
end
