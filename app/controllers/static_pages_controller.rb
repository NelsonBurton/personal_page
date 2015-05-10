class StaticPagesController < ApplicationController
	def home
	end
	def about
	end
	def downloadresume
   		send_file 'public/data/BurtonResume2015.pdf', :type=>"application/pdf", :x_sendfile=>true
	end
end
