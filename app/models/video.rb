class Video < ActiveRecord::Base
    has_many :reviews
    has_many :ratings
    belongs_to :user
end