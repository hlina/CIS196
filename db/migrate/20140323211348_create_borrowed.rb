class CreateBorrowed < ActiveRecord::Migration
  def change
    create_table :borrowed do |t|
      t.belongs_to :user, index: true
      t.belongs_to :book, index: true

      t.timestamps
    end
  end
end
