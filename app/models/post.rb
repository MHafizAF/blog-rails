class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates_associated :user
  validates :title, :body, presence: true
end
