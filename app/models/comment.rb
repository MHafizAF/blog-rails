class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates_associated :user
  validates :comment, presence: true
end
