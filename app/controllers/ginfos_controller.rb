class GinfosController < ApplicationController

  def new
    @ginfo=Ginfo.new
    scene=@ginfo.build_scene
  end

  def edit
    @users=User.all.includes(:ginfos)
    @user=User.find(params[:id])
    @ginfos=Ginfo.all
    @ginfo=Ginfo.find(params[:id])
  end

  def create

    @ginfo=Ginfo.new(ginfo_params)
    @ginfo.save
    respond_to do |f|
      if @ginfo.save
        f.html { redirect_to :root, notice: 'Your Registration is finished!' }
        f.json { render :root, status: :ok, location: @ginfo }
      else
        f.html { render :new }
        f.json { render json: @ginfo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

private
  def ginfo_params
    params.require(:ginfo).permit(:user_id,:age,:sex,:tel_number,:face_picture,:hitokoto_shoukai, :shoukaibun, scene_attributes: [:scene_picture1])
  end

    # def ginfo_params
    #   params.fetch(:ginfo, {})
    # end
end
