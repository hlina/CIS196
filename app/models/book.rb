class Book < ActiveRecord::Base
  belongs_to :user
  has_many :borrowed, :dependent => :destroy

  #validations
  validates :title, presence: true
  validates :author, presence: true
  validates :body, length: {maximum: 1500}, presence: true
  validates :rating, presence: true
  validates :filepicker_url, presence: true
end
