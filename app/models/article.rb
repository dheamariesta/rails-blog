class Article < ApplicationRecord
  belongs_to :user
  has_many :favorites
  validates :title, presence: true,
                    length: { minimum: 5 }
end
