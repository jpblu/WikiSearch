class HomeController < ApplicationController
  def index
    #controller index.html.erb
    @mstsrc = Tablewords.order(wfcount: :desc).limit(5)

  end

  def find
    #controller search.html.erb
    require 'httparty'
    require 'htmlentities'

    #verifica inserimento dati server-side
    check = Text2find.new(wordinput: params[:wikiword])
    unless check.valid?
      flash[:error] = check.errors
      return redirect_to root_path 
      render flash[:error]
    end

    #interrogo l'API di wikipedia per i risultati della ricerca
    @urlwiki = 'https://it.wikipedia.org/w/api.php?action=query&list=search&srsearch='+params[:wikiword]+'&format=json'
    @wikires = HTTParty.get(@urlwiki)

    #verifico nel db se la parola cercata è presente
    if Tablewords.where(word2find: params[:wikiword]).count > 0
      #aggiorno counter
      updword = Tablewords.where(word2find: params[:wikiword])
      updword.update_all 'wfcount = wfcount + 1'
    else
      #inserisco nuovo record
      newword = Tablewords.new
        newword.word2find = params[:wikiword]
        newword.wfcount = 1
      newword.save
    end

    @srctot = Tablewords.where(word2find: params[:wikiword]).first

    render 'search'

  end

end
