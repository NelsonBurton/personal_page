require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	p = Person.new
  	p.age = 23
  	p.height = 73
  	p.weight = 181
  	p.bodyfat = 21
  	p.save
  end
  test "did a person get created" do
  	assert Person.first
  end
  
end
