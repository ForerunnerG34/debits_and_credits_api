require "test_helper"

class JournalTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test 'should create journal with one' do
    transaction = Transaction.new(amount: 9.99, user: @user)
    journal = Journal.new(description: 'new journal', user: @user, transactions: [transaction])
    assert journal.valid?
  end

  test 'should not create journal with no transactions' do
    journal = Journal.new(description: 'new journal', user: @user, transactions: [])
    assert_not journal.valid?
  end

  test 'should not create journal with more than two transactions' do
    transaction_one = Transaction.new(amount: 9.99, user: @user)
    transaction_two = Transaction.new(amount: 9.99, user: @user)
    transaction_three = Transaction.new(amount: 9.99, user: @user)
    journal = Journal.new(description: 'new journal', user: @user, transactions: [transaction_one, transaction_two, transaction_three])

    assert_not journal.valid?
  end

end
