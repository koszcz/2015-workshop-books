class Comment < ActiveRecord::Base
  include Likeable
  
  belongs_to :book
end
