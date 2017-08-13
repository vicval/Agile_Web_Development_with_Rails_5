class ApplicationController < ActionController::Base
  before_action :authorize
  protect_from_forgery with: :exception


  protected
  	#def authorize
  	#	unless User.find_by(id: session[:user_id]) || User.count == 0
  	#		redirect_to login_url, notice: "Please log in" 			
  	#	end
  	#end

  	def authorize
  		#teste http://localhost:3000/products/2/who_bought.atom
  		#ou curl --silent --user dave:secret http://localhost:3000/products/2/who_bought.atom 
  		return if User.count.zero?

  		if request.format == Mime[:html]
  			user = User.find_by(id: session[:user_id])
  		else
  			user = authenticate_or_request_with_http_basic do |u,p|
  				User.find_by_name(u).try(:authenticate, p)
  			end
  		end

  		redirect_to login_url, notice: "Please log in" unless user
  		
  	end

end
