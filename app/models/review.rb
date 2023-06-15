class Review < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { in: 4..200 }
  
end
