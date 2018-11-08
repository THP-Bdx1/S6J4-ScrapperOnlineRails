class HomeController < ApplicationController
  def index
    @crypto=Crypto.all
    @crypto1=Crypto.new
    if @crypto == []
    StartScrapp.new.perform
    else
    # Les 3 lignes suivantes servent a mettre a jour les cryptomonnaies, le scrap etant long nous l'avons retirer pour des raison de confort.
    # Crypto.destroy_all
    # ActiveRecord::Base.connection.reset_pk_sequence!("cryptos")
    # StartScrapp.new.perform
    end
    @crypto=Crypto.all
  end

  def create

  redirect_to "/home/#{params[:crypto][:id]}"
  end

  def show
  end

  def reset
    Crypto.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence!("cryptos")
    StartScrapp.new.perform
  end

end
  
