class MangasController < ApplicationController

	# GET request
	def index
		@title = "Manga List"
		@mangas = Manga.paginate( :page => params[:page] )
	end
	
	# GET request
	def new
		if user_signed_in?
			@manga = current_user.mangas.new
		else
			
		end
	end
	
	# POST request
	def create
		@manga = current_user.mangas.build( params[:manga] )
		if @manga.save
			flash[:success] = "Manga successfully created!"
			redirect_to current_user
		else
			flash[:error] = "Failed to create manga..."
			redirect_to root_path
		end
	end
	
	# GET request
	def show
		@manga = Manga.find_by_id(params[:id])	
		
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
