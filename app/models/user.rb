class User < ActiveRecord::Base
    has_many :racecars
    has_secure_password
    validates_presence_of :username, :team_name, :manufacturer
    validates :username, uniqueness: true
end