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
        f.html { redirect_to :root, notice: 'Your Registration is finished!' }
        f.json { render :root, status: :ok, location: @ginfo }
      else
        f.html { render :new }
        f.json { render json: @ginfo.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def ginfo_params
    params.permit(:age, :sex, :tel_number, :face_picture, :user_id)
  end
end
