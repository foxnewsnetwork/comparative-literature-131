class KomasController < ApplicationController

	# GET request
	def show
		@manga = Manga.find_by_id(params[:manga_id])
		@chapter = @manga.chapters.find_by_id(params[:chapter_id])
		@koma = @chapter.komas.find_by_id(params[:id])
		@layers = @koma.layers
		@layer = @koma.layers.new
		if user_signed_in?
			@correct_user = @manga.collaborators.empty? ? false : @manga.collaborators.find_by_id(current_user.id).empty?
			@correct_user = @manga.user.id == current_user.id
		end
	end
	
	# GET request
	def new
		@manga = Manga.find_by_id(params[:manga_id])
		@chapter = @manga.chapters.find_by_id(params[:chapter_id])
		@koma = @chapter.komas.new	
		@correct_user = @manga.user.id == current_user.id
	end
	
	# POST request
	def create
		@manga = Manga.find_by_id(params[:manga_id])
		@chapter = @manga.chapters.find_by_id(params[:chapter_id])
		@koma = @chapter.komas.build( params[:koma] )
		if @koma.save
			flash[:success] = "Koma successfully created!"
			redirect_to [@manga, @chapter, @koma]
		else
			flash[:error] = "Failed to create a new koma..."
			redirect_to @chapter
		end
	end
	
	# GET request
	def index
		@manga = Manga.find_by_id(params[:manga_id])
		@chapter = @manga.chapters.find_by_id(params[:chapter_id])
		@komas = @chapter.komas.paginate( :page => params[:page] )
	end
	
end
