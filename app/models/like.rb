class Like < ApplicationRecord
    belongs_to :article
    belongs_to :author
end
