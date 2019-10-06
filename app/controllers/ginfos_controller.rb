class GinfosController < ApplicationController

  def new
    @ginfos=Ginfo.all
    @ginfo=Ginfo.new
  end

  def edit
    @users=User.all.includes(:ginfos)
    @user=User.find(params[:id])
    @ginfos=Ginfo.all
    @ginfo=Ginfo.find(params[:id])
  end

  def create

  end
end
