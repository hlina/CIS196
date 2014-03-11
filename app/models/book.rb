class Book < ActiveRecord::Base
  belongs_to :user

  #validations
  validates :title, presence: true
  validates :body, length: {maximum: 1500}, presence: true
end
