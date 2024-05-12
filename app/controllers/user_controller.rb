class UserController < ApplicationController 
  def index 
    # get the list of users from the database 
    @user_list = User.all.order(:username)

    render({:template => "/user_templates/index"})
  end 
  def show 
    u_name = params.fetch("path_id")
    matched_user = User.where({:username => u_name})
    @user = matched_user.at(0)
    
    render({:template => "/user_templates/show"})
  end 
  def create 
    new_user = User.new
    new_user.username = params.fetch("query_username")
    new_user.save 

    redirect_to("/users/#{new_user.username}")
  end 
  def update 
    the_user = params.fetch("path_id")

    update_user = User.where({:username => the_user}).at(0)
    update_user.username = params.fetch("query_username")
    if update_user.valid?
      update_user.save
    end
    username = User.where({:username => update_user.username}).at(0)
    redirect_to("/users/#{username.username}")
  end 
end 
