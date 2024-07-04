class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  # def create
  #   @bookmark = Bookmark.new(bookmark_params)
  #   @list = List.find(params[:list_id])
  #   if @bookmark.save
  #     redirect_to list_path(@list)
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  def create
    @list = List.find(params[:list_id])
    @bookmark = @list.bookmarks.build(bookmark_params)
    if @bookmark.save
      redirect_to list_path(@list), notice: 'Bookmark created !'
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@list), notice: "Successfully deleted the bookmark!"
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

end
