class UsersController < ApplicationController
  before_action :authenticate_user!, :only => [:show]

  def index
    @users=User.all
    @ginfos=Ginfo.all

  end

  def show
    @users=User.all.includes(:ginfos)
    @user=User.find(params[:id])
<<<<<<< HEAD
    @ginfo=Ginfo.find_by(user_id:current_user.id)
=======
    @ginfo=Ginfo.new(ginfo_params)

>>>>>>> cecf6ec54dae54d5b4b3af76ddd6c9f5f9245faf

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
