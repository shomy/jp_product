class RoomsController < ApplicationController
  before_action :authenticate_user!
  def create
    @room = Room.create
    @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
    redirect_to "/rooms/#{@room.id}"
  end

  def index
    @entrys=Entry.where(user_id: current_user.id)
    entry_pluck=@entrys.pluck(:room_id)
    @en=Entry.where(room_id:entry_pluck)
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
      @messages = @room.messages
      @message = Message.new
      @entries = @room.entries
      en_user=Entry.where(room_id:@room.id)
      en_user_id=en_user.pluck(:user_id)
      @user=User.where(id:en_user_id)
    else
      redirect_back(fallback_location: root_path)
    end
  end
end
