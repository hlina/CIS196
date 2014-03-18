class AddImageForFilepickerUrlToBook < ActiveRecord::Migration
  def change
    add_column :books, :filepicker_url, :string
  end
end
