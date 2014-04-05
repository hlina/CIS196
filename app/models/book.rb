class Book < ActiveRecord::Base
  belongs_to :user

  #validations
  validates :title, presence: true
  validates :body, length: {maximum: 1500}, presence: true
  validates :filepicker_url, presence: true

  def self.search(search)
  	if search
      @search = '%' + search +'%'
  		@books_s = Book.where('title LIKE ?', @search)
  	else 
  		@books_s = []
  	end
  end
end
