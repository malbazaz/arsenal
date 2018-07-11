#require 'pry' 
#require 'nokogiri'
#
#
#class Arsenal::Scraper
#
#  def self.scrape_main_page
#    main_page = Nokogiri::HTML(read("https://www.arsenal.com/first-team/players"))
#    players = {}
#    @scrapped_players = []
#      main_page.css(".block-arsenal-main-content").each_with_index do |player, index|
#        @scrapped_players[index] = {
#          :first_name => player.css(".player-card_info_name").text,
#          :second_name => player.css(".player-card_info_position_or_first_name").text
#          :profile_url => player.css("a").attribute("href").value
#          }
#      end
#
##binding.pry
#
#
#
#end #