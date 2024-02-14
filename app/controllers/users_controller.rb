class UsersController < ApplicationController 
  
  def index 
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc})
    render({:template => "/user_templates/index"})
  end 

  def show
    url_username = params.fetch("path_username")
    User.where({ :username => url_username })
    matching_usernames = User.where({:username => url_username})
    @the_user = matching_usernames.first
    render({:template => "/user_templates/show"})
  end 

  def create 
    @the_user = User.new
    @the_user.username = params.fetch("input_username")
    @the_user.save 
    redirect_to("/users/#{@the_user.username}", { :notice => "User created successfully." })
  end 

  def update 
      the_id = params.fetch("path_id")
      @the_user = User.find(the_id)
      @the_user.username = params.fetch("input_username")
      @the_user.save 
      redirect_to("/users/#{@the_user.username}", { :notice => "User updated successfully."})
  end 

end
