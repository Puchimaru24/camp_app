class GearsController < ApplicationController

  def index
    @user = current_user
    @gear1 = Gear.where(user_id: @user.id, category: "住居系")
    @gear2 = Gear.where(user_id: @user.id, category: "料理系")
    @gear3 = Gear.where(user_id: @user.id, category: "火周り系")
    @gear4 = Gear.where(user_id: @user.id, category: "その他")
  end
  
  def show
    @gear = find_gear_by_id
  end

  def new
    @gear = Gear.new
  end
  
  def create
    @gear = Gear.new(gear_params)
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
    @gear = find_gear_by_id
    if @gear.update(gear_params)
      flash[:notice] = "編集が完了しました"
      redirect_to gears_path
    else
      flash.now[:alert] = "必須項目を入力してください"
      render :edit
    end
  end
  
  def destroy
    @gear = find_gear_by_id
    @gear.destroy
    redirect_to gears_path
    flash[:notice] = "ギアを削除しました"
  end
  
  private
  def gear_params
    params.require(:gear).permit(:category, :name, :maker, :price, :memo, :image)
  end
  
  def find_gear_by_id
    Gear.find(params[:id])
  end
end
