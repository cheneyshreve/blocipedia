class WikisController < ApplicationController

  # before_action :require_sign_in, except: :show
  # before_action :authorize_user, except: [:show, :new, :create]

  def index
    @wikis = Wiki.all
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def destroy
  end

end
