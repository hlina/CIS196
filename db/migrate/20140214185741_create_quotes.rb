class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.text :body
      t.string :category
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
