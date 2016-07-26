require 'rest-client'
require 'json'
require 'pry'

def title(book)
  book['volumeInfo']['title']
end

def authors(book)
  book['volumeInfo']['authors'].join(" and ")
end

def list_price(book)
  if book['saleInfo'].has_key?('listPrice')
    book['saleInfo']['listPrice']['amount']
  else
    'Not For Sale'
  end
end

def retail_price(book)
  if book['saleInfo'].has_key?('retailPrice')
    book['saleInfo']['retailPrice']['amount']
  else
    'Not For Sale'
  end
end

url = 'https://www.googleapis.com/books/v1/volumes?q=ruby+programming'

response = RestClient.get(url)
data = JSON.parse(response)

books = data["items"]

books.each do |book|
  puts "#{title(book)} by #{authors(book)}"
  puts "List Price: #{list_price(book)}"
  puts "Retail Price: #{retail_price(book)}"
end

# 1. Make a web request and get back the JSON string
# 2. Turn that JSON string into a hash so I can access the data
# 3. Display that data to the user through the command line
  # Title, author names, list price, retail price
