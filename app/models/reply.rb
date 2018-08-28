class Reply < ApplicationRecord
    belongs_to :comment
    belongs_to :user
    belongs_to :article

    validates_presence_of :content, length: { minimum: 10 }
end
