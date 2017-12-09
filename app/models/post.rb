class Post < ApplicationRecord
	belongs_to :user
	mount_uploader :image, ImageUploader
	acts_as_ordered_taggable_on :interests
	validates :title, presence: true
	validates :body, presence: true
end
