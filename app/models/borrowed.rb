class Borrowed < ActiveRecord::Base
  self.table_name = 'borrowed'
  belongs_to :user
  belongs_to :book
end
