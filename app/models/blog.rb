class Blog < ActiveRecord::Base
validates :title, presence: true
belongs_to :user

mount_uploader :gzou, GzouUploader
end
