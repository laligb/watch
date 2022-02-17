class BookmarksController < ApplicationController
  def index
    @bookmark = Bookmark.all
  end

  def create
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list.id)
    else
      render :new
    end
  end

  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to bookmark_path(@bookmark)
  end


  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
