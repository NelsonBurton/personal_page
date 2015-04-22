class PersonController < ApplicationController
  def home
  	@person = Person.new
  end
end
