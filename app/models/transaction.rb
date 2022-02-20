class Transaction < ApplicationRecord
    belongs_to :journal, inverse_of: :transactions
    validates :amount, numericality: { greater_than_or_equal_to: 0 }
    validates :amount, presence: true
end
