class Transaction < ApplicationRecord
    belongs_to :journal, inverse_of: :transactions
end
