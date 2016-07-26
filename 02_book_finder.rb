require 'rest-client'
require 'json'
require 'pry'

def title(book)
  book['volumeInfo']['title']
end

def authors(book)
  book['volumeInfo']['authors'].join(" and ")
end

def prices(book, type=nil)
  if type == 'list'
    if book['saleInfo'].has_key?('listPrice')
    book['saleInfo']['listPrice']['amount']
    else
      'Not For Sale'
    end
  elsif type == 'retail'
    if book['saleInfo'].has_key?('retailPrice')
      book['saleInfo']['retailPrice']['amount']
    else
      'Not For Sale'
    end
  end
end

url = 'https://www.googleapis.com/books/v1/volumes?q=ruby+programming'

response = RestClient.get(url)
data = JSON.parse(response)

books = data["items"]

books.each do |book|
  puts "#{title(book)} by #{authors(book)}"
  puts "List Price: #{prices(book, 'list')}"
  puts "Retail Price: #{prices(book, 'retail')}"
end

# 1. Make a web request and get back the JSON string
# 2. Turn that JSON string into a hash so I can access the data
# 3. Display that data to the user through the command line
  # Title, author names, list price, retail price
