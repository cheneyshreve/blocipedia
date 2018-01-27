class WikisController < ApplicationController

  # before_action :require_sign_in, except: :show
  before_action :authenticate_user!, except: [:show, :new, :create]

  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
  end

  def create
   @wiki = Wiki.new
   @wiki.title = params[:wiki][:title]
   @wiki.body = params[:wiki][:body]

   if @wiki.save
     flash[:notice] = "Wiki was saved."
     redirect_to @wiki
   else
     flash.now[:alert] = "There was a problem saving the wiki."
     render :new
   end
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def destroy
  end

end
