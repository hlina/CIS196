class Quote < ActiveRecord::Base
  belongs_to :user
  validates :body, presence: true, length: {maximum: 300}, uniqueness: true
end
