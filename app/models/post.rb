class Post < ApplicationRecord
  belongs_to :blogger
  belongs_to :destination

  validates :title, presence: true
  validates :content, { :length => { :minimum => 100}}

  def up_like
    self.likes += 1
    self.save
  end

  def down_like
    self.likes -= 1
    self.save
  end 

end
