class SetsController < ApplicationController
  def index
    @sets = GearSet.all
  end
  
  def show
    
  end
  
  def new
    @set = GearSet.new
  end
  
  def create
    @set = GearSet.new(set_params)
    if @set.save
      flash[:notice] = "登録が完了しました"
      redirect_to sets_path
    else
      flash.now[:alert] = "必須項目を入力してください"
      render "/sets/new"
    end
  end
  
  private
  def set_params
    params.permit(:name, :title)
  end
  
  def find_set_by_id
    GearSet.find(params[:id])
  end
end
