class UsersController < ApplicationController
  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb" })
  end

  def info
    # Parameters: {"path_username"=>"anisa"}
    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.first

    # if @the_user == nil
    #   redirect_to("/404")
    # else
    render({ :template => "user_templates/info.html.erb" })
    # end
  end

  def add_user
    the_username = params.fetch("input_username")

    a_new_user = User.new

    a_new_user.username = the_username

    a_new_user.save

   # render({ :template => "user_templates/insert_user_record.html.erb"})
   next_url = "/users/" + the_username
   redirect_to(next_url)
  end

  def update_u
    the_id = params.fetch("u_id") #User's username
    new_user = User.where({:id =>the_id}).at(0) #declaring "new_user"
    new_username = params.fetch("input_username")
    new_user.username = new_username
    new_user.save

    next_url = "/users/" + new_username
    redirect_to(next_url)
  end
end
