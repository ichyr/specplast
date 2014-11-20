class ErrorController < ApplicationController
	def show
		render "error_#{params[:error_code]}"
	end

  def error_402
  end

  def error_404
  end

  def error_500
  end
end
