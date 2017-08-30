class User < ApplicationRecord
  has_secure_password

  has_many :articles, dependent: :destroy
  has_many :favourites
  has_many :favourite_articles, through: :favourites, source: :article
end
