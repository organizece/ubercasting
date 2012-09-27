class Photo < ActiveRecord::Base

  belongs_to :model

  attr_accessible :image

  has_attached_file :image, :styles => { :thumb => "100x100>" }

end
