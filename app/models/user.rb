class User < ActiveRecord::Base
has_many :books, :dependent => :destroy
has_many :quotes, :dependent => :destroy
end
