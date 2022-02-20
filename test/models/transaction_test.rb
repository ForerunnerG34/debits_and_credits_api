require "test_helper"

class TransactionTest < ActiveSupport::TestCase
  setup do
    @journal = journals(:one)
  end

  test 'transaction with positive amount should be valid' do
    transaction = Transaction.new(amount: 9.99, journal: @journal)
    assert transaction.valid?
  end

  test 'transaction with negative amount should be invalid' do
    transaction = Transaction.new(amount: -9.99, journal: @journal)
    assert_not transaction.valid?
  end

  test 'transaction without amount should be invalid' do
    transaction = Transaction.new(journal: @journal)
    assert_not transaction.valid?
  end

  test 'transaction without journal should be invalid' do
    transaction = Transaction.new(amount: 9.99)
    assert_not transaction.valid?
  end
end
