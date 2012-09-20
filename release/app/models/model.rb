class Model < ActiveRecord::Base
  attr_accessible :age, :name

  belongs_to :agency
end
