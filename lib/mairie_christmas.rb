require 'nokogiri'
require 'open-uri'


def get_townhall_email(townhall_url)

  puts "Récupération de l'email à l'adresse : #{townhall_url}..."

  document = Nokogiri::HTML(URI.open(townhall_url))
  townhall_email_element = document.xpath("//p[@class='infos__item -email ']/a")
  townhall_email = townhall_email_element[0].content

  puts "Email récupéré !"
  print "\n"

  return townhall_email

end

def get_townhalls_urls()
  puts "récupération des urls des mairies..."

  base_url = "https://www.aude.fr"

  document = Nokogiri::HTML(URI.open("https://www.aude.fr/annuaire-mairies-du-departement"))
  urls = document.xpath("//a[@class='directory-block__img-link composite-link']").map {|e| base_url + e['href']}

  puts "URLs récupérés ! "
  print "\n"

  return urls

end


def main()
  townhalls_urls = get_townhalls_urls()
  array = []

  for url in townhalls_urls do
    ville = url.split("-")[-1]
    array << {ville => get_townhall_email(url)}
  end

  return array
end
