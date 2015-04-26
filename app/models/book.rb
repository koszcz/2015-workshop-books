class Book < ActiveRecord::Base
  include Likeable
  mount_uploader :photo, PhotoUploader
  
  has_many :comments
end
