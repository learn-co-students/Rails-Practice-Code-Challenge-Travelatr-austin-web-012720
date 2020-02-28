class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def last_five_posts
    the_five = posts.last(5)
  end 

  def total_likes
    # sum of all likes across all blogger's posts
    sum = 0
    posts.each do |post|
      sum += post.likes
    end 
    sum
  end 

  def featured_post
    featured = posts.max_by do |post|
      post.likes
    end 
  end

  def average_age
    blogger_count = bloggers.count
    age_total = 0
    bloggers.each do |blogger|
      age_total += blogger.age
    end 
    avg = age_total/blogger_count
    avg
  end 

end
