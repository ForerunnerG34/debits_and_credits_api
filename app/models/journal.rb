class Journal < ApplicationRecord
  belongs_to :user
  has_many :transactions, dependent: :destroy
  validates_presence_of :user
  validates :transactions, length: {
    minimum: 1,
    maximum: 2,
    message: 'A Journal can only have 1 or 2 transactions'
  }

end
