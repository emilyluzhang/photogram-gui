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
end 
