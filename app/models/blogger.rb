class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates :name, { presence: true, uniqueness: true }
  validates :age, numericality: { presence: true, greater_than: 0 }
  validates :bio, { :length => { :minimum => 30 }}

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
    
    # loop through posts for a blogger and identify the post with the most likes
    # just_likes = []
    # posts.each do |post|
    #   just_likes << post.likes 
    # end 
  end 

  def last_five_posts
    the_five = posts.last(5)
  end


end