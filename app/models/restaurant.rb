class Restaurant < ApplicationRecord

  has_many :reviews

  CATEGORY = ["chinese", "italian", "japanese", "french", "belgian"]
  validates :name, presence:true
  validates :address, presence:true
  validates :category, inclusion: { in: CATEGORY }

end
