class PhotosController < ApplicationController 
  
  def index 
    matching_photos = Photo.all 
    @list_of_photos = matching_photos.order({ :created_at => :desc})
    render({ :template => "/photo_templates/index"})
  end 

  def show
    url_id = params.fetch("path_id")
    matching_photos= Photo.where({:id => url_id})
    @the_photo = matching_photos.first
    render({ :template => "/photo_templates/show"})
  end 

  def destroy 
    the_id= params.fetch("path_id")
    matching_photos = Photo.where({:id => the_id})
    the_photo = matching_photos.first 
    the_photo.destroy
    redirect_to("/photos", { :notice => "Photo deleted successfully."})
  end 

  def create 
    @the_photo = Photo.new 
    @the_photo.image = params.fetch("input_image")
    @the_photo.caption = params.fetch("input_caption")
    @the_photo.owner_id = params.fetch("input_owner_id")
    @the_photo.save 
    
    redirect_to("/photos/#{@the_photo.id}", { :notice => "Photo added successfully."})

  end 

  def update_photo
    photo_id = params.fetch("path_id")
    @the_photo = Photo.find(photo_id)
    @the_photo.image = params.fetch("input_image")
    @the_photo.caption = params.fetch("input_caption")
    @the_photo.save
    redirect_to("/photos/#{@the_photo.id}", { :notice => "Photo updated successfully"})
  end 

end
