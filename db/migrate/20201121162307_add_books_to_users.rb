class AddBooksToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :books, :string
  end
end
