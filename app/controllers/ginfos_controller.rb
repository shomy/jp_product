class GinfosController < ApplicationController

  def new
    @ginfo=Ginfo.new
  end

  def edit
    @users=User.all.includes(:ginfos)
    @user=User.find(params[:id])
    @ginfos=Ginfo.all
    @ginfo=Ginfo.find(params[:id])
  end

  def create
    @ginfo=Ginfo.new(ginfo_params)
    respond_to do |f|
      if @ginfo.save(ginfo_params)
        format.html { redirect_to @ginfo, notice: 'Your Registration is finished!' }
        format.json { render :root, status: :ok, location: @ginfo }
      else
        format.html { render :new }
        format.json { render json: @ginfo.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def ginfo_params
    params.require(:user).permit(:id)
  end
end
