class ZipSearch::CLI
require 'pry'

  # def call
  #   puts "Welcome to ZipSearch"
  #   state
  # end

  # def state
  #   @state = ""
  #   puts "Enter State:"
  #   @state = gets.to_s.upcase
  #   city
  # end

  # def city
  #   @city = ""
  #   puts "Enter City:"
  #   @city = gets.to_s.upcase
  #   street
  # end

  # def street
  #   @street = ""
  #   puts "Enter Street:"
  #   @street = gets.to_s.upcase
  #   zip_scrape
  # end

  def call
    puts "Time to scrape a URL using this info:"
    # puts "STREET: #{@street}"
    # puts "CITY:   #{@city}"
    # puts "STATE:  #{@state}"
    ZipSearch::Scraper.new("Servant", "Street", "NH")
# enter zip_scrape magic code here...

  end

end