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
      redirect_to("/users/#{update_user.username}", { :notice => "Username updated successfully."} )
    else
      redirect_to("/users/#{the_user}", { :alert => "Username failed to update successfully." })
    end
    redirect_to("/users/#{update_user.username}")
  end 
end 
