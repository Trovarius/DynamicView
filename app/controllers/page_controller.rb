class PageController < ApplicationController

	def index
		
	end
		
	def show
		@page = Page.find(params[:id])
		@result = @page.execute_command
		[@page, @result]
	end
	
	def edit
		
	end
	
	def new
		@page = Page.find(params[:id])
	end
	
	def insert
		@page = Page.find(params[:id])
		@action = @page.actions.find(params["executed_action"].keys[0])
		
		logger.info params
		result = @action.execute(params)
		#logger.info request.env
		redirect_to list_page_path(@page)
	end
	
	def search
	end
	
	def list
		@page = Page.find(params[:id])
		@result = @page.execute_command
		[@page, @result]
	end
end
