require 'nokogiri'
require 'open-uri'




def main
    document = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

    puts "document récupéré\n\n"

    crypto_symbols = document.xpath("//td[@class='cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--hide-sm cmc-table__cell--sort-by__symbol']/div")
    puts "symboles isolés \n\n"

    crypto_prices = document.xpath("//div[@class='sc-b3fc6b7-0 dzgUIj']/span")
    puts "prix isolés \n\n"


    crypto_symbols = crypto_symbols.map {|element| element.content} 
    crypto_prices = crypto_prices.map {|element| element.content.gsub(/[,$]/, '').to_f}



    final_array = []

    for i in 0..crypto_symbols.length-1 do
        final_array << {crypto_symbols[i] => crypto_prices[i]}
    end

    return final_array
end