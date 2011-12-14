class LayersController < ApplicationController

	# GET
	def new
		@manga = Manga.find_by_id(params[:manga_id])
		@chapter = @manga.chapters.find_by_id(params[:chapter_id])
		@koma = @chapter.komas.find_by_id(params[:koma_id])
		@layer = @koma.layers.new
		@layer_before = params[:layer_before]
		@layer_after = params[:layer_after]
		@correct_user = @manga.collaborators.empty? ? @manga.user.id == current_user.id : @manga.collaborators.find_by_id(current_user.id).empty?
	end
	
	# POST
  def create	
  	# Step 2: initialize the usual suspects
  	@manga = Manga.find_by_id(params[:manga_id])
  	@chapter = @manga.chapters.find_by_id(params[:chapter_id])
  	@koma = Koma.find_by_id(params[:koma_id])
  
  	# Step 1: check if we have permission
  	@correct_user = @manga.collaborators.empty? ? @manga.user.id == current_user.id : @manga.collaborators.find_by_id(current_user.id).empty?
  		
  	# Step 3: if we're the correct user we make the necessary things
  	if @correct_user
  			@picture = current_user.pictures.build(params[:layer][:picture])
  			# Step 4: We try to save the picture if the user uploaded one
  			if @picture.save
  				@layer = @koma.layers.build(:picture_id => @picture)
  				# Step 5: We try to make a layer with the picture
  				if @layer.save
  					flash[:success] = "New layer created!"
  					redirect_to manga_path(@manga) + chapter_path(@chapter) + koma_path(@koma) + layer_path(@layer)
  				else # Step 5: Well, something went wrong and no layer
  					flash[:error] = "Unable to create layer..."
  					redirect_to manga_path(@manga) + chapter_path(@chapter) + koma_path(@koma)
  				end
  			else #step 4: if not, we try to just make a layer
  				@layer = @koma.layers.new
  				if @layer.save
  					flash[:notice] = "New layer created, but you need to put in a picture"
  					redirect_to manga_path(@manga) + chapter_path(@chapter) + koma_path(@koma) + edit_layer_path(@layer)
  				else
  					flash[:error] = "Unable to create either layer or upload picture. Lame"
  					redirect_to manga_path(@manga) + chapter_path(@chapter) + koma_path(@koma)
  				end
  			end
  	else	# Step 3: if we're not, we redirect
  		flash[:error] = "You need to be a collaborator because you can upload to someone else's manga"
  		redirect_to @manga
  	end
  end
	
	#GET
	def show
		@manga = Manga.find_by_id(params[:manga_id])
	  	@chapter = @manga.chapters.find_by_id(params[:chapter_id])
	  	@koma = @chapter.komas.find_by_id(params[:koma_id])
		@layer = @koma.layers.find_by_id(params[:id])
	end
	
	#GET
	def edit
	
	end
	
	# DELETE
	def destroy
	end

	#PUT
	def update
	end

end
