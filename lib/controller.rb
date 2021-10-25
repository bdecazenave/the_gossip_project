
# Ce fichier contient une classe qui hérite des propriétés de Sinatra et qui sert de guide pour naviguer entre les fichiers
require 'gossip'

class ApplicationController < Sinatra::Base

# affiche la HomePage de notre site quand le user se rend sur le serveur
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
# affiche la page de création du gossip
  get '/gossips/new/' do
    erb :new_gossip
  end
# Récupère les inputs du user et applique la méthode "save" pour l'injecter dans le csv
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"],params["gossip_content"]).save
    redirect '/'
  end
#
  get '/gossips/:id/' do
    id = params["id"].to_i
    erb :show, locals: {gossips: Gossip.find(id)}
  end

end
