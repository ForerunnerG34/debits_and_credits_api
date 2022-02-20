class AddJournalToTransaction < ActiveRecord::Migration[7.0]
  def change
    add_reference :transactions, :journal, null: false, foreign_key: true
  end
end
