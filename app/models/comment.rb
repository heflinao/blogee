class Comment < ActiveRecord::Base
	validates :author, presence: true
	validates :content, presence: true, length: { minimum: 15, message: "Content must be at least 15 characters long." }

	belongs_to :post
end
