class UsersController < ApplicationController
  before_action :authenticate_user!, :only => [:show,:index]

  def index
    @users=User.all.includes(:ginfos)
    @user=User.find(current_user.id)
    @ginfos=Ginfo.all
    @ginfo=Ginfo.find_by(user_id:@user.id)
  end

  def show
    @users=User.all.includes(:ginfos)
    @user=User.find(params[:id])



    @ginfo=Ginfo.find_by(user_id:@user.id)
    @scene = Scene.find_by(ginfo_id:@ginfo.id)

    if @scene.nil?
      @scene = Scene.new(ginfo_id:@ginfo.id)
      @scene.scene_picture1 = '/assets/default.png'
      @scene.save
    end
    if @scene.scene_picture1.nil?
      @scene = Scene.new(ginfo_id:@ginfo.id)
      @scene.scene_picture1 = '/assets/default.png'
    end

    @currentUserEntry=Entry.where(user_id: current_user.id)
    @userEntry=Entry.where(user_id: @user.id)
    if @user.id == current_user.id
    else
      @currentUserEntry.each do |cu|
        @userEntry.each do |u|
          if cu.room_id == u.room_id then
            @isRoom = true
            @roomId = cu.room_id
          end
        end
      end
      if @isRoom
      else
        @room = Room.new
        @entry = Entry.new
      end
    end
  end


  def ginfo_params
    params.permit(:age, :sex, :tel_number, :face_picture, :user_id)
  end



end
