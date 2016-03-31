class CollaboratorsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    wiki_id = 55
    collaborator = Collaborator.new(user: user, wiki_id: wiki_id)
    if collaborator.save
      flash[:notice] = "Collaborator added."
    else
      flash[:alert] = "Collaboration failed."
    end
    redirect_to edit_wiki_path(wiki_id)
  end

  def destroy
    user = User.find(params[:user_id])
    wiki_id = 55
    collaborator = Collaborator.where(user: user, wiki_id: wiki_id).first
    if collaborator.destroy
      flash[:notice] = "Collaborator removed."
    else
      flash[:alert] = "De-Collaboration failed."
    end
    redirect_to edit_wiki_path(wiki_id)
  end

end
