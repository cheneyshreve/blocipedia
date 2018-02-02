class CollaboratesController < ApplicationController
  def create
    @wiki = Wiki.find(params[:wiki_id])
    @user = User.find_by(email: params[:collaborate][:user])
    @collaborator = @wiki.collaborates.new(wiki_id: @wiki.id, user_id: @user.id)

    # need to revise to avoid duplicate adds, consider bad entries, and privacy controls
     if @collaborator.save
       flash[:notice] = "#{@user.email} successfully added to wiki."
     else
       flash[:error] = "There was a problem adding the user. Please try again."
     end
   redirect_to @wiki
  end

  def destroy
    @wiki = Wiki.find(params[:wiki_id])
    @collaborator = Collaborate.find(params[:id])

    if @collaborator.destroy
       flash[:notice] = "Collaborator has been removed from the wiki collaboration."
    else
      flash[:error] = "There was an error removing the user. Please try again."
    end
    redirect_to @wiki
  end

  # def show
  #   @wiki = Wiki.find(params[:wiki_id])
  #   current_collaborators = @wiki.users
  # end

end
