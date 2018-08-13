require 'sinatra'
require 'curb'
require 'json'


get '/' do
 @data = Curl::Easy.perform("https://www.eventbriteapi.com/v3/events/search/?q=baking&sort_by=date&location.address=new+york+city&token=FGTPMLNV7K6MQVZZCC6S")
 @req = JSON.parse(@data.body_str)
 erb :index
end

post '/results' do
  @seach = params[:query]
 erb :results
end


get '/about' do
  erb :about
end

get '/contact' do
  erb :contact
end

get '/muffins' do
  erb :muffins
end

get '/cookies' do
  $cookies = []
  class Cookie
    attr_accessor :name, :price, :img, :description
    def initialize(name,price,img,description)
      @name = name
      @price = price
      @img = img
      @description = description
      $cookies << self
    end
  end

  cookie1 = Cookie.new("Cheesecake", "$39.99", "images/cookie1.png", "Rich and creamy. Our famous traditional cheesecake is a crowd pleaser.")
  cookie2 = Cookie.new("Cookies and Cream", "$39.99", "images/cookie2.png", "Rich and creamy. Our famous traditional cheesecake is a crowd pleaser.")
  cookie3 = Cookie.new("Apple Cinnamon", "$39.99", "images/cookie3.png", "Rich and creamy. Our famous traditional cheesecake is a crowd pleaser.")
  cookie4 = Cookie.new("When Life Gives You Lemons","$39.99", "images/cookie4.png", "Rich and creamy. Our famous traditional cheesecake is a crowd pleaser.")
  cookie5 = Cookie.new("Fruitcake Bonanza", "$39.99", "images/cookie5.png", "Rich and creamy. Our famous traditional cheesecake is a crowd pleaser.")
  erb :cookies
end

get '/cakes' do
  $cakes = []
  class Cake
    attr_accessor :name, :price, :img, :description
    def initialize(name,price,img,description)
      @name = name
      @price = price
      @img = img
      @description = description
      $cakes << self
    end
  end

  cake1 = Cake.new("Cheesecake", "$39.99", "images/cake1.png", "Rich and creamy. Our famous traditional cheesecake is a crowd pleaser.")
  cake2 = Cake.new("Cookies and Cream", "$39.99", "images/cake2.png", "Rich and creamy. Our famous traditional cheesecake is a crowd pleaser.")
  cake3 = Cake.new("Apple Cinnamon", "$39.99", "images/cake3.png", "Rich and creamy. Our famous traditional cheesecake is a crowd pleaser.")
  cake4 = Cake.new("When Life Gives You Lemons","$39.99", "images/cake4.png", "Rich and creamy. Our famous traditional cheesecake is a crowd pleaser.")
  cake5 = Cake.new("Fruitcake Bonanza", "$39.99", "images/cake5.png", "Rich and creamy. Our famous traditional cheesecake is a crowd pleaser.")
  erb :cakes
end
