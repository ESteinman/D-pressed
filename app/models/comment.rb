class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user

  has_many :replies

  validates_presence_of :content, length: { minimum: 10 }
end
