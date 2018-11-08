class HomeController < ApplicationController
  def index
    @crypto=Crypto.all
    @crypto1=Crypto.new
    if @crypto == nil
    StartScrapp.new.perform
    else
    Crypto.destroy_all
    StartScrapp.new.perform
    end
  end

  def create

  redirect_to "/home/#{params[:crypto][:id]}"
  end
  
  def show
  end

end
