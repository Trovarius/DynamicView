class PageController < ApplicationController
	
	require 'base64'
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
	
	def detail
		@page = Page.find(params[:id])
		decrypt_key = Base64.decode64(params[:key])
		where = @page.create_where_by_request(decrypt_key)
		
		@result = @page.execute_command(where)
		[@page, @result]
	end
end
