class Topic < ApplicationRecord
  has_many :votes, dependent: :destroy
  validates :title, presence: true, length: {minimum:5}
  validates :description, presence: true, length: {minimum:7}
end