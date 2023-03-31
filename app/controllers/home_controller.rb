class HomeController < ApplicationController
	def index
		# Scope your query to the dates being shown:
		start_date = params.fetch(:date, Date.today).to_date
		@events = Event.where(date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
	
    # To display cats to home page
    @cats = Cat.all
    @catsresidents = Cat.where(adoption: false)
    @catsadoptables = Cat.where(adoption: true)
  end
end
