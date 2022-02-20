require "test_helper"

class JournalTest < ActiveSupport::TestCase
  test 'should create journal' do
    journal = Journal.new(description: 'new journal')  
    assert_not journal.valid?
  end
end
