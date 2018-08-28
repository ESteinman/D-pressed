class Rating < ApplicationRecord
    belongs_to :article
    belongs_to :user

    validates_presence_of :value, :user, :article
end
