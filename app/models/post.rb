class Post < ActiveRecord::Base
  belongs_to :user
	validates :title, :content, presence: true
	has_many :comments
end
