class Comment < ActiveRecord::Base
  include Likeable
  
  belongs_to :book

  def made_within_one_hour?(current_time)
  	current_time - created_at <= 1.hour
  end
end
