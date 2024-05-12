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
    new_photo.owner_id = params.fetch("query_owner_id")
    new_photo.caption = params.fetch("query_caption")
    new_photo.image = params.fetch("query_image")

    new_photo.save 

    redirect_to("/photos/#{new_photo.id}")
  end 
  def update 
    @photo_id = params.fetch("path_id")
    update_photo = Photo.where({:id => @photo_id}).at(0)
    
    update_photo.image = params.fetch("query_image")
    update_photo.caption = params.fetch("query_caption")

    update_photo.save

    redirect_to("/photos/#{update_photo.id}")
  end 
  def comment 
    new_comment = Comment.new 

    new_comment.photo_id = params.fetch("query_photo_id")
    new_comment.author_id = params.fetch("query_author")
    new_comment.body = params.fetch("query_comment")

    new_comment.save 

    redirect_to("/photos/#{new_comment.photo_id}")

  end 
end 
