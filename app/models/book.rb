class Book < ActiveRecord::Base
  include Likeable
  
  has_many :comments
end
