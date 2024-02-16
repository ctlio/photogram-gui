class UsersController < ApplicationController

  def index

    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })
    render({:template => "/user_templates/index"})

  end

  def show
    url_username = params.fetch("path_username")
    matching_usernames = User.where({:username => url_username})
    @the_user = matching_usernames.first

    #if @the_user == nil
      
      #redirect_to("/404")
    #else
      render({:template => "/user_templates/show"})
    #end  
  end
  def create
    u = User.new
    u.username = params.fetch("the_username")

    u.save

    redirect_url = "/users/" + u.username
    redirect_to(redirect_url)

  end

  def update
    id_username = params.fetch("path_username")
    matching_username = User.where({ :username => id_username})
    update_username = matching_username.at(0)

    update_username.username = params.fetch("the_username")

    update_username.save

    
    redirect_url = "/users/"+ update_username.username
    redirect_to(redirect_url)

  end
end
