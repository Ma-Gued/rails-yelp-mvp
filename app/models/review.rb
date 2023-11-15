class Review < ApplicationRecord
  belongs_to :restaurant

  RATES = [1, 2, 3, 4, 5]

  validates :content, presence:true
  validates :rating, presence:true
  validates :rating, inclusion: { in: RATES }

end
