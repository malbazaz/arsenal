 
require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

binding.pry 

def self.scrape_main_page

    main_page = Nokogiri::HTML(open("https://www.arsenal.com/first-team/players"))
    binding.pry 
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


def self.scrape_profile_page(player)
	# takes in a player and provide his profile url
    
    profile_page = Nokogiri::HTML(open(profile_url))
    profile_links={}
      profile_page.css(".social-icon-container").children.css("a").each do |link|
        if link.attribute("href").value.include?("twitter")
          profile_links[:twitter] = link.attribute("href").value
        elsif link.attribute("href").value.include?("linkedin")
          profile_links[:linkedin] = link.attribute("href").value
        elsif link.attribute("href").value.include?("github")
          profile_links[:github] = link.attribute("href").value
        else 
          profile_links[:blog] = link.attribute("href").value
        end 
      end 
    profile_links[:profile_quote] = profile_page.css(".profile-quote").text.strip
    profile_links[:bio] = profile_page.css(".description-holder p").text.strip
    profile_links
  end
#main_page.css(".info-card__key:contains('Name')~.info-card__value").first.text
#main_page.css(".info-card__key:contains('Born')~.info-card__value").first.text
#main_page.css(".info-card__key:contains('Previous Clubs')~.info-card__value").first.text
#main_page.css(".info-card__key:contains('Squad Number')~.info-card__value").first.text
#main_page.css(".info-card__key:contains('Twitter')~.info-card__value").first.text

#main_page.css(".article-body").css("p~p").text.gsub!("\u00A0", " ")

#binding.pry

end

