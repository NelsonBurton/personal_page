class Person < ActiveRecord::Base
	validates :age, presence: true
	validates :height, presence: true
	validates :weight, presence: true
	validates :bodyfat, presence: true
end
