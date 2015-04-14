class User < ActiveRecord::Base
    has_many :reviews
    has_many :ratings
    has_many :videos
end