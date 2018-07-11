 
require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

#binding.pry 

def self.scrape_main_page
	# scrapes the main page and creates an array with hashes inside representing each player's name and url

    main_page = Nokogiri::HTML(open("https://www.arsenal.com/first-team/players"))
    #binding.pry 
    @scrapped_players = []
    first_http = "https://www.arsenal.com"
#binding.pry
      main_page.css(".player-card").each_with_index do |player, index|
        @scrapped_players[index] = {
          :name => player.css(".player-card__info__position-or-first-name").text + " " + player.css(".player-card__info__name").text,
          :profile_url =>  first_http + player.css("a").attribute("href").value }
      end
     @scrapped_players
  end 


def self.scrape_profile_page(player)
	binding.pry
	# takes in a player and provide his profile url
	input_profile_url = player.profile_url
	#returns all the information i.e. full profile of player selected
    profile_page = Nokogiri::HTML(open(input_profile_url))
    profile_links={}
    profile_links[:name] = profile_page.css(".info-card__key:contains('Name')~.info-card__value").first.text
    profile_links[:born] = profile_page.css(".info-card__key:contains('Born')~.info-card__value").first.text
    profile_links[:previous_clubs] = profile_page.css(".info-card__key:contains('Previous Clubs')~.info-card__value").first.text
    profile_links[:squad_number] = profile_page.css(".info-card__key:contains('Squad Number')~.info-card__value").first.text
    profile_links[:twitter] = profile_page.css(".info-card__key:contains('Twitter')~.info-card__value").first.text
    profile_links[:bio] = profile_page.css(".article-body").css("p~p").text.gsub!("\u00A0", " ")

    profile_links
  end
#profile_page.css(".info-card__key:contains('Name')~.info-card__value").first.text
#profile_page.css(".info-card__key:contains('Born')~.info-card__value").first.text
#profile_page.css(".info-card__key:contains('Previous Clubs')~.info-card__value").first.text
#profile_page.css(".info-card__key:contains('Squad Number')~.info-card__value").first.text
#profile_page.css(".info-card__key:contains('Twitter')~.info-card__value").first.text
#profile_page.css(".article-body").css("p~p").text.gsub!("\u00A0", " ")

#binding.pry

end

