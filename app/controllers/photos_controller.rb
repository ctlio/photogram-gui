class PhotosController < ApplicationController

  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({:created_at => :desc })

    render({:template => "/photo_templates/index"})
  end

  def show
    url_id = params.fetch("path_id")
    matching_photos = Photo.where({ :id => url_id })

    @the_photo = matching_photos.at(0)

    render({:template => "/photo_templates/show"})
  end

  def destroy
    the_id = params.fetch("path_id")
    matching_photos = Photo.where({:id => the_id})

    the_photo = matching_photos.at(0)

    the_photo.destroy

    redirect_to("/photos")

  end

  def create
    p = Photo.new
    p.image = params.fetch("query_image")
    p.caption = params.fetch("query_caption")
    p.owner_id = params.fetch("query_owner_id")

    p.save

    redirect_to("/photos/"+ p.id.to_s)
    #render({:template => "/photo_templates/create"  })

  end

  def update
    a_id = params.fetch("path_id")
    matching_photo = Photo.where({ :id => a_id})
    u = matching_photo.at(0)

    u.image = params.fetch("query_image")
    u.caption = params.fetch("query_caption")
    
    u.save

    #render({:template => "/photo_templates/update"})
    redirect_to("/photos/"+ u.id.to_s)
  end

end
