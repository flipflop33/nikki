class LinksController < ApplicationController
  def index
    @links = Link.all
  end

  def show
      @link = Link.find(params[:id])
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    @link.user = current_user
      if @link.save
        redirect_to link_path(@link), alert: "Link succesfully created!"
      else
        render :new
      end
  end


  private
  def link_params
    params.require(:link).permit(:title, :url)
  end

end
