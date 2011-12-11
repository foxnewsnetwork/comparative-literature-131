class ChaptersController < ApplicationController

	# GET request
	def new
		@manga = Manga.find_by_id(params[:manga_id])
		@chapter = @manga.chapters.new
	end
	
	# POST request
	def create
		@manga = Manga.find_by_id(params[:manga_id])
		@chapter = @manga.chapters.build(params[:chapter])
		if @chapter.save
			flash[:success] = "New chapter successfully created!"
			redirect_to( manga_path(@manga) + chapter_path(@chapter))
		else
			flash[:error] = "Failed to create new chapter"
			redirect_to manga_path(@manga)
		end
	end
	
	# GET request
	def show
		# Normal people should just be content to read the manga
		@manga = Manga.find_by_id(params[:manga_id])
		@chapter = @manga.chapters.find_by_id(params[:id])
		@komas = @chapter.komas.paginate( :page => params[:page] )
		
		# Collaborators and owners can add new content
		@correct_user = @manga.collaborators.find_by_id(current_user.id).nil? ? true : false
		@correct_user = @manga.user.id == current_user.id		
	end
	
	def edit
	
	end
	
	def destroy
	
	end
	
	
	
end
