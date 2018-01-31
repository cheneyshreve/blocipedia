class WikisController < ApplicationController

   before_action :authenticate_user!, except: [:show, :new, :create]

  def index
   @wikis = Wiki.all
  end

  def show
    @wikis = Wiki.all
  end

  def new
    @wiki = Wiki.new
    @user = current_user
  end

  def create
   @wiki = Wiki.new
   @wiki.title = params[:wiki][:title]
   @wiki.body = params[:wiki][:body]
   @wiki.user = current_user
   @wiki.private = params[:wiki][:private]

   if @wiki.save
     flash[:notice] = "Wiki was saved."
     redirect_to wikis_path
   else
     flash.now[:alert] = "There was a problem saving the wiki."
     render :new
   end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    @wiki.assign_attributes(wiki_params)

    if @wiki.save
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :edit
    end
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    if @wiki.destroy
      flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
      redirect_to wikis_path
    else
      flash.now[:alert] = "There was an error deleting the wiki."
      render :show
    end
  end

  private
  def wiki_params
    params.require(:wiki).permit(:title, :body)
  end

end
