require 'rubygems'
require 'nokogiri'
require 'open-uri'


class StartScrapp
    def initialize
        @url = "https://coinmarketcap.com/all/views/all/"
    end

    def perform
        save(@url)
    end

    def save(url)
        page = Nokogiri::HTML(open(url))  

        crypto_name = []
        path_crypto = page.css("a.currency-name-container.link-secondary")
        path_crypto.each do |section|
            crypto_name << section.text
        end

        crypto_value = []
        path_value= page.css("a.price")
        path_value.each do |section|
            crypto_value << section.text
        end
        
        compteur = 0
        while compteur <= crypto_name.length
            Crypto.create!(crypto_name: crypto_name[compteur], crypto_value: crypto_value[compteur])
            compteur = compteur + 1
        end
    end
end
