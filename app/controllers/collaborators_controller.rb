class CollaboratorsController < ApplicationController

  def create
    @user = User.find(params[:user_id])
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.new(user: @user, wiki: @wiki)
    if @collaborator.save
      flash[:notice] = "Collaborator '#{@user.name}' added."
    else
      flash[:alert] = "Collaboration failed."
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborator.find_by(user: @user, wiki: @wiki)
    if @collaborator.destroy
      flash[:notice] = "Collaborator '#{@user.name}' removed."
    else
      flash[:alert] = "De-Collaboration failed."
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

end
