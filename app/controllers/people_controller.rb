class PeopleController < ApplicationController

  def home
  	@person = Person.new
    render(template: 'people/home', layout: 'application')
  end

  def create
  	@person = Person.new(person_params)
    
  	if @person.valid?
      render 'table'
    else
      render 'home'
    end
	end

  def update
    render plain: "yo"
  end

  def rando
    @person = Person.new(age: params[:age], weight: params[:weight], height: 5, bodyfat: params[:bodyfat])
    render(partial: 'details', layout: false)
  end

  
  def singledigit
    render plain: '4'
  end

  private

  def person_params
    params.require(:person).permit(:age, :weight, :height, :bodyfat)
  end

end
