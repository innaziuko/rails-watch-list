class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy]

  def index
    @lists = List.all
  end

  def show
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end


# class ListsController < ApplicationController

#   def index
#     @lists = List.all
#   end

#   def show
#     @lists = List.find(params[:id])
#   end

#   def new
#     @lists = List.new
#   end

#   def create
#     @lists = List.new(list_params)
#     @list.save
#     redirect_to list_path(@list)
#   end
# end

# private

# def list_params
#   params.require(:list).permit(:name)
# end
