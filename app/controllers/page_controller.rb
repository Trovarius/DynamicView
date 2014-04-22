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
		@page.insert_command(params)
		redirect_to show_path(@page.id)
	end
	
	def search
	end
	
	def list
		@page = Page.find(params[:id])
		@result = @page.execute_command
		[@page, @result]
	end
end
