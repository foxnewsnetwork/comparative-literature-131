class MangasController < ApplicationController
	before_filter :authenticate, :only => [ :create, :update, :edit]
	before_filter :is_owner, :only => [ :destroy ]

	# GET request
	def index
		@title = "Manga List"
		@mangas = Manga.paginate( :page => params[:page] )
	end
	
	# GET request
	def new
	
	end
	
	# POST request
	def create
	
	end
	
	# GET request
	def show
	
	end
	
	# PUT request
	def update
	
	end
	
	# GET request
	def edit
	
	end
	
	# DELETE request
	def destroy
	
	end
	
end
