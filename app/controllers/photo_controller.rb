class PhotoController < ApplicationController 
  def index 
    @photos = Photo.all.order(:created_at, :desc)
    render({:template => "/photo_templates/index"})
  end
  def show 
    p_id = params.fetch("path_id")
    matched_photo = Photo.where({:id => p_id})
    @photo = matched_photo.at(0)

    render({:template => "/photo_templates/show"})
  end
  def destroy
    the_id = params.fetch("path_id")
    @the_photo = Photo.find(the_id)

    @the_photo.destroy

    redirect_to("/photos", { :notice => "Photo deleted successfully."} )
  end
  def create 
    new_photo = Photo.new
    new_photo.user_id = params.fetch("query_owner_id")
    new_photo.caption = params.fetch("query_caption")
    new_photo.image = params.fetch("query_image")

    new_photo.save 

    redirect_to("/photos")
  end 
end 
