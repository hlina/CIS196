class RemoveDateFromBooks < ActiveRecord::Migration
  def change
    remove_column :books, :date, :date
  end
end
