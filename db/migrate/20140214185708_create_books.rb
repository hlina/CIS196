class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :body
      t.string :category
      t.belongs_to :user, index: true
      t.date :date
      t.float :rating

      t.timestamps
    end
  end
end
