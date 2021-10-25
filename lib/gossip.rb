#require 'bundler'
#Bundler.require

require 'csv'

class Gossip
attr_accessor :author, :content, :id

# Une méthode qui initialise les attributs author et content
  def initialize(author, content)
    @author = author
    @content = content
    @id = id
  end

# Une méthode qui ouvre un fichie csv et y inscrit l'auteur et le potin
  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

# Une méthode qui lit le csv, crée un array et y injecte le contenu du csv
  def self.all
    all_gossips = []
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

#Une méthode qui crée une variable, va lire toutes les lignes du CSV et retourner l'id en conséquence
  def self.find(id)
    find_it =CSV.readlines("./db/gossip.csv")[id]
    return find_it
  end


end
