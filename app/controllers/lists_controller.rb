class ListsController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    if user_signed_in?
      @lists = List.feed_for(current_user)
    else
      @lists = List.public_lists
    end
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user

    if @list.save
      redirect_to @list
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name, :public)
  end
end
