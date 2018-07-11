 
require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

binding.pry 

  def self.scrape_main_page(main)

    main_page = Nokogiri::HTML(open("https://www.arsenal.com/first-team/players"))
    players = {}
    @scrapped_players = []
    first_http = "https://www.arsenal.com"
#binding.pry
      main_page.css(".player-card").each_with_index do |player, index|
        @scrapped_players[index] = {
          :name => player.css(".player-card__info__name").text + " " + player.css(".player-card__info__position-or-first-name").text,
          :profile_url =>  first_http + player.css("a").attribute("href").value
          							}
      end
  end 

#binding.pry



end