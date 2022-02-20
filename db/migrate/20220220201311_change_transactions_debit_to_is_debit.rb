class ChangeTransactionsDebitToIsDebit < ActiveRecord::Migration[7.0]
  def change
    rename_column :transactions, :debit, :is_debit
  end
end
