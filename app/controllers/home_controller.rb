class HomeController < ApplicationController
  def index
    #controller index.html.erb
    #https://it.wikipedia.org/w/api.php?action=query&list=search&srsearch=guerra&format=json
  end

  def find
    require 'httparty'
    require 'htmlentities'

    @urlwiki = 'https://it.wikipedia.org/w/api.php?action=query&list=search&srsearch='+params[:text2find]+'&format=json'
    @wikires = HTTParty.get(@urlwiki)

    render 'search'

  end

end
