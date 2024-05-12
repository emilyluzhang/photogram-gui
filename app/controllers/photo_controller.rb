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
end 
