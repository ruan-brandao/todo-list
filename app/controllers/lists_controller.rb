class ListsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_list, only: [:show, :edit, :update, :destroy]
  before_action :check_owner, only: [:edit, :update, :destroy]

  def index
    if user_signed_in?
      @lists = List.feed_for(current_user)
    else
      @lists = List.public_lists
    end
  end

  def show
  end

  def new
    @list = List.new
    @list.tasks.build
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

  def edit
    @list.tasks.build
  end

  def update
    if @list.update(list_params)
      redirect_to @list
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_url
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :public, tasks_attributes: [:id, :text, :done, :_destroy])
  end

  def check_owner
    redirect_to "/", alert: "Permission Denied" if @list.user != current_user
  end
end
