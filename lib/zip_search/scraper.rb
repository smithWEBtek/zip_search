class ZipSearch::Scraper
  require 'pry'
  attr_accessor :search

  def initialize(street, suffix, state)
    @street = street
    @suffix = suffix
    @city = state
    scrape
  end

  # https://www.melissadata.com/lookups/zipstreet.asp?Step4=NH&Name=SERVANT&suffix=ST
# <input type="text" name="q" id="q" class="form-control" placeholder="Enter a location" value="bedford, nh" autocomplete="off">
# Step4=#{@state}&Name=#{@street}&suffix=#{@suffix}"))
  def scrape
    doc = Nokogiri::HTML(open("http://www.unitedstateszipcodes.org/"))
     
  binding.pry
     doc.css("p.row").each do |row|
    @url_id << row.search("a").attr(name="href").value
    @url_id.delete_if {|i| i.include?("//")}
    end
    scrape_url
  end

  def scrape_url
    @url_id.each do |id|
    doc = Nokogiri::HTML(open("http://boston.craigslist.org""#{id}"))
      listing = PianoSearch::PianoListing.new
      listing.price = doc.css("span.price").first.text
      listing.headline = doc.css("span#titletextonly")[0].text
      listing.location = doc.css("small").text.strip.gsub!("(google map)", "")
      listing.detail = doc.css("#postingbody").text
      listing.url = "http://boston.craigslist.org""#{id}"
    end
  end
 
end