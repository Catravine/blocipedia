class CollaboratorsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    @wiki = Wiki.find(params[:wiki_id])
    collaborator = Collaborator.new(user: user, wiki: @wiki)
    if collaborator.save
      flash[:notice] = "Collaborator added."
    else
      flash[:alert] = "Collaboration failed."
    end
    redirect_to edit_wiki_path(@wiki)
  end

  def destroy
    user = User.find(params[:user_id])
    @wiki = Wiki.find(params[:wiki_id])
    collaborator = Collaborator.find_by(user: user, wiki: @wiki)
    if collaborator.destroy
      flash[:notice] = "Collaborator removed."
    else
      flash[:alert] = "De-Collaboration failed."
    end
    redirect_to edit_wiki_path(@wiki)
  end

end
