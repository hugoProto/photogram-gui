class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all

    @list_of_photos = matching_photos.order({ :created_at => :desc })

    render({ :template => "photo_templates/index.html.erb" })
  end

  def show
    # Parameters: {"path_id"=>"777"}
    url_id = params.fetch("path_id")

    matching_photos = Photo.where({ :id => url_id})

    @the_photo = matching_photos.at(0)

    render({ :template => "photo_templates/show.html.erb"})
  end

  def goodbye
    # Parameters: {"toast_id"=>"785"} or "777"

    the_id = params.fetch("toast_id")

    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.at(0)

    the_photo.destroy

   # render({ :template => "photo_templates/goodbye.html.erb"})

   redirect_to("/photos")
  end

  def create
    # Parameters: {"query_image"=>"https://www.chicagobooth.edu/-/media/project/chicago-booth/why-booth/story-hub/new-stories-2022/november/chicago-booth-military-map.jpg?cx=0.51&cy=0.45&cw=940&ch=749&hash=127249BCE97FA9BD48608D0C6C809E27", "query_caption"=>"Chicago Booth", "query_owner_id"=>"117"}

  input_image = params.fetch("query_image")
  input_caption = params.fetch("query_caption")
  input_owner_id = params.fetch("query_owner_id")

  a_new_photo = Photo.new

  a_new_photo.image = input_image
  a_new_photo.caption = input_caption
  a_new_photo.owner_id = input_owner_id

  a_new_photo.save

   # render({ :template => "photo_templates/create.html.erb"})

   redirect_to("/photos/" + a_new_photo.id.to_s)
  end
end
