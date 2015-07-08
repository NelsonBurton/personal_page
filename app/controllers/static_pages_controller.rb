class StaticPagesController < ApplicationController
	def home
	end
	def about
	end
	def posts
		@post_name = params['id']
		render "posts"
		# render :partial => "posts/#{params['id']}"
	end
end
