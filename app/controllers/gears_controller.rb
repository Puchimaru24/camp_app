class GearsController < ApplicationController

  def index
    @user = current_user
    @gears = Gear.where(user_id: @user.id)
  end
  
  def show
    @gear = find_gear_by_id
  end

  def new
    @gear = Gear.new
  end
  
  def create
    @gear = Gear.new(
      gear_params
      )
    @gear.user_id = current_user.id
      if @gear.save
        flash[:notice] = "ギア登録が完了しました"
        redirect_to gears_path
      else
        flash.now[:alert] = "必須項目を入力してください"
        render "/gears/new"
      end
  end
  
  def edit
    @gear = find_gear_by_id
  end
  
  def update
    gear = find_gear_by_id
    gear.update(gear_params)
    redirect_to gears_path
    flash[:notice] = "編集が完了しました"
  end
  
  def destroy
    @gear = find_gear_by_id
    @gear.destroy
    redirect_to gears_path
    flash[:notice] = "ギアを削除しました"
  end
  
  private
  def gear_params
    params.require(:gear).permit(:category, :name, :maker, :price, :memo)
  end
  
  def find_gear_by_id
    Gear.find(params[:id])
  end
end
