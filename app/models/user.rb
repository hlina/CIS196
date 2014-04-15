class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
has_many :books, :dependent => :destroy
has_many :quotes, :dependent => :destroy
has_many :followers, foreign_key: :follower_id, :dependent => :destroy
has_many :followers, foreign_key: :followee_id, :dependent => :destroy

end

