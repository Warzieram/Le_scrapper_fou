require 'nokogiri'
require 'open-uri'
require 'watir'
require 'watir-scroll'



def main

    browser = Watir::Browser.new
    browser.goto "https://coinmarketcap.com/all/views/all/"
    browser.execute_script("window.scrollBy(0, 2000)")
    browser.execute_script("window.scrollBy(0, 2000)")
    browser.execute_script("window.scrollBy(0, 2000)")
    browser.execute_script("window.scrollBy(0, 2000)")
    browser.execute_script("window.scrollBy(0, 2000)")
    
    document = Nokogiri::HTML.parse(browser.html)

    puts "document récupéré\n\n"

    crypto_symbols = document.xpath("//td[@class='cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--hide-sm cmc-table__cell--sort-by__symbol']/div")
    puts "symboles isolés \n\n"

    crypto_prices = document.xpath("//div[@class='sc-b3fc6b7-0 dzgUIj']/span")
    puts "prix isolés \n\n"


    crypto_symbols = crypto_symbols.map {|element| element.content} 
    crypto_prices = crypto_prices.map {|element| element.content.gsub(/[,$]/, '').to_f}

    puts crypto_prices.length

    final_array = []

    for i in 0..crypto_symbols.length-1 do
        final_array << {crypto_symbols[i] => crypto_prices[i]}
    end

    return final_array
end

puts main()