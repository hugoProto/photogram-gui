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

   next_url = "/photos/" + a_new_photo.id.to_s

   redirect_to(next_url)
  end

  def update
    # Parameters: {"query_image"=>"https://www.chicagobooth.edu/-/media/project/chicago-booth/why-booth/story-hub/new-stories-2022/november/chicago-booth-military-map.jpg?cx=0.51&cy=0.45&cw=940&ch=749&hash=127249BCE97FA9BD48608D0C6C809E27", "query_caption"=>"Chicago Booth", "query_owner_id"=>"117"}

    the_id = params.fetch("modify_id")

    matching_photos = Photo.where({ :id => the_id })

    the_photo = matching_photos.at(0)

    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")

    the_photo.image = input_image
    the_photo.caption = input_caption
    
    the_photo.save

    # render({ :template => "photo_templates/update.html.erb" })

    next_url = "/photos/" + the_photo.id.to_s

    redirect_to(next_url)
  end

  def comment_photo
  photo_id = params.fetch("input_photo_id")
    author_id = params.fetch("input_author_id")
    comment_body = params.fetch("input_body")
    comment_new = Comment.new

    comment_new.photo_id = photo_id
    comment_new.author_id = author_id
    comment_new.body = comment_body
    comment_new.save

    photo_url = "/photos/" + photo_id.to_s
    redirect_to(photo_url)
  end
end
