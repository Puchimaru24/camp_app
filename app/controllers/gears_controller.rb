class GearsController < ApplicationController
  def index
    @gears = Gear.all
  end
  
  def show
    @gear = Gear.find(params[:id])
  end

  def new
    @gear = Gear.new
  end
  
  def create
    @gear = Gear.new(gear_params)
      if @gear.save
        flash[:notice] = "ギア登録が完了しました"
        redirect_to gears_path
      else
        flash.now[:alert] = "必須項目を入力してください"
        render "/gears/new"
      end
  end
  
  def destroy
    @gear = Gear.find(params[:id])
    @gear.destroy
    redirect_to gears_path
    flash[:notice] = "ギアを削除しました"
  end
  
  def gear_params
    params.require(:gear).permit(:category, :name, :maker, :price, :memo)
  end
  
end
